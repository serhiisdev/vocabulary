import 'package:flutter/material.dart';

class CheckboxOptionWidget extends StatefulWidget {
  final VoidCallback onTap;

  /// Will not be invoked on initial animation completion. I.e. when the [CheckboxOptionWidget] is first created and initial
  /// [isSelected] is passed to the widget. Will be invoked on subsequent animation completions.
  final VoidCallback? onSelectedAnimationCompleted;
  final EdgeInsets containerPadding;
  final double borderRadius;
  final bool isSelected;
  final String text;
  final TextStyle textStyle;
  final bool showCheckIconBorderWhenUnselected;
  final Color checkIconColor;
  final Color selectedBorderColor;
  final Color unselectedBorderColor;
  final double selectedBorderWidth;
  final double unselectedBorderWidth;

  const CheckboxOptionWidget({
    super.key,
    required this.onTap,
    required this.onSelectedAnimationCompleted,
    this.containerPadding = const EdgeInsets.only(
      left: 24,
      right: 12,
      top: 12,
      bottom: 12,
    ),
    this.borderRadius = 26,
    required this.isSelected,
    required this.text,
    required this.textStyle,
    this.showCheckIconBorderWhenUnselected = false,
    required this.checkIconColor,
    required this.selectedBorderColor,
    required this.unselectedBorderColor,
    required this.selectedBorderWidth,
    required this.unselectedBorderWidth,
  });

  @override
  State<CheckboxOptionWidget> createState() => _CheckboxOptionWidgetState();
}

class _CheckboxOptionWidgetState extends State<CheckboxOptionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _borderWidth;
  late Animation<Color?> _borderColor;
  late Animation<double> _checkboxOpacity;
  bool _skipSelectionAnimationCallback = false;

  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _setupAnimations();
    _controller.addStatusListener(_onStatusChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _skipSelectionAnimationCallback = widget.isSelected;
      _handleIsSelectedChange(widget.isSelected);
    });
  }

  void _onStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (widget.onSelectedAnimationCompleted != null &&
          !_skipSelectionAnimationCallback) {
        widget.onSelectedAnimationCompleted!();
      } else {
        _skipSelectionAnimationCallback = false;
      }
    }
  }

  void _setupAnimations() {
    _borderWidth = Tween<double>(
      begin: widget.unselectedBorderWidth,
      end: widget.selectedBorderWidth,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _borderColor = ColorTween(
      begin: widget.unselectedBorderColor,
      end: widget.selectedBorderColor,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _checkboxOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant CheckboxOptionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedBorderColor != widget.selectedBorderColor ||
        oldWidget.unselectedBorderColor != widget.unselectedBorderColor ||
        oldWidget.selectedBorderWidth != widget.selectedBorderWidth ||
        oldWidget.unselectedBorderWidth != widget.unselectedBorderWidth) {
      _setupAnimations();
    }
    if (oldWidget.isSelected != widget.isSelected) {
      _handleIsSelectedChange(widget.isSelected);
    }
  }

  void _handleIsSelectedChange(bool isSelected) {
    if (_isSelected == isSelected) return;
    setState(() {
      _isSelected = isSelected;
      _isSelected ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_onStatusChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      button: true,
      enabled: true,
      checked: _isSelected,
      onTap: widget.onTap,
      label: widget.text,
      excludeSemantics: true,
      child: _AnimatedWidget(
        onTap: widget.onTap,
        containerPadding: widget.containerPadding,
        borderRadius: widget.borderRadius,
        text: widget.text,
        textStyle: widget.textStyle,
        checkIconColor: widget.checkIconColor,
        showCheckIconBorderWhenUnselected:
            widget.showCheckIconBorderWhenUnselected,
        unselectedBorderWidth: widget.unselectedBorderWidth,
        borderWidth: _borderWidth,
        borderColor: _borderColor,
        checkboxOpacity: _checkboxOpacity,
      ),
    );
  }
}

class _AnimatedWidget extends AnimatedWidget {
  final VoidCallback onTap;
  final EdgeInsets containerPadding;
  final double borderRadius;
  final String text;
  final TextStyle textStyle;
  final Color checkIconColor;
  final bool showCheckIconBorderWhenUnselected;
  final double unselectedBorderWidth;
  final Animation<double> borderWidth;
  final Animation<Color?> borderColor;
  final Animation<double> checkboxOpacity;

  _AnimatedWidget({
    required this.onTap,
    required this.containerPadding,
    required this.borderRadius,
    required this.text,
    required this.textStyle,
    required this.checkIconColor,
    required this.showCheckIconBorderWhenUnselected,
    required this.unselectedBorderWidth,
    required this.borderWidth,
    required this.borderColor,
    required this.checkboxOpacity,
  }) : super(
         listenable: Listenable.merge([
           borderWidth,
           borderColor,
           checkboxOpacity,
         ]),
       );

  @override
  Widget build(BuildContext context) {
    Widget child = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(text, style: textStyle)),
        SizedBox(width: 8),
        _CheckIcon(
          opacity: checkboxOpacity.value,
          color: checkIconColor,
          showCheckIconBorderWhenUnselected: showCheckIconBorderWhenUnselected,
          unselectedBorderWidth: unselectedBorderWidth,
        ),
      ],
    );

    child = Container(
      padding: containerPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor.value ?? Colors.grey,
          width: borderWidth.value,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: child,
    );
  }
}

class _CheckIcon extends StatelessWidget {
  final double opacity;
  final double unselectedBorderWidth;
  final Color color;

  /// If true, the circle border will be shown when the checkbox is unselected.
  /// Otherwise when unselected, nothing will be drawn at all at the place of the check icon.
  final bool showCheckIconBorderWhenUnselected;
  const _CheckIcon({
    required this.opacity,
    required this.unselectedBorderWidth,
    required this.color,
    required this.showCheckIconBorderWhenUnselected,
  });

  @override
  Widget build(BuildContext context) {
    const checkIconSize = 24.0;
    if (showCheckIconBorderWhenUnselected) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: checkIconSize,
            height: checkIconSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: color,
                width: unselectedBorderWidth,
                strokeAlign: BorderSide.strokeAlignInside,
              ),
            ),
          ),
          Opacity(
            opacity: opacity,
            child: Icon(
              Icons.check_circle,

              /// We add 4 here to make icon size equal to the container size.
              /// As this icon has built-in padding, it appears smaller than the container below it when
              /// specifying just [checkIconSize]. To make them the same size, this workaround is needed.
              size: checkIconSize + 4,
              color: color,
            ),
          ),
        ],
      );
    }
    return Opacity(
      opacity: opacity,
      child: Icon(Icons.check_circle, size: checkIconSize, color: color),
    );
  }
}
