import 'package:flutter/material.dart';

/// Scrollable widget, like SingleChildScrollView, can be wrapped with this widget to listen to overscroll events.
class OverscrollListenerWidget extends StatefulWidget {
  final VoidCallback onTopOverscroll;
  final VoidCallback onBottomOverscroll;
  final double threshold;
  final Widget child;

  const OverscrollListenerWidget({
    super.key,
    required this.child,
    required this.onTopOverscroll,
    required this.onBottomOverscroll,
    this.threshold = 120.0,
  });

  @override
  State<OverscrollListenerWidget> createState() =>
      _OverscrollListenerWidgetState();
}

class _OverscrollListenerWidgetState extends State<OverscrollListenerWidget> {
  bool _topTriggered = false;
  bool _bottomTriggered = false;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.depth != 0) return false;
        if (notification is ScrollEndNotification) {
          _topTriggered = false;
          _bottomTriggered = false;
          return false;
        }

        if (notification is! ScrollUpdateNotification) return false;

        final position = notification.metrics.pixels;
        final max = notification.metrics.maxScrollExtent;
        final min = notification.metrics.minScrollExtent;

        final isMaxValid = max.isFinite;
        final isMinValid = min.isFinite;
        double overscroll = 0;

        if (position < min) {
          overscroll = isMinValid ? position - min : 0;
        } else if (position > max) {
          overscroll = isMaxValid ? position - max : 0;
        }

        if (overscroll.abs() < widget.threshold) {
          return false;
        }

        if (overscroll.isNegative && !_topTriggered) {
          _topTriggered = true;
          widget.onTopOverscroll();
          return false;
        }

        if (!overscroll.isNegative && !_bottomTriggered) {
          _bottomTriggered = true;
          widget.onBottomOverscroll();
          return false;
        }

        return false;
      },
      child: widget.child,
    );
  }
}
