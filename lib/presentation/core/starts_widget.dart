import 'package:flutter/material.dart';

class StartsWidget extends StatelessWidget {
  final int count;
  final Color? color;
  final double? size;
  final double spacing;
  const StartsWidget({
    super.key,
    required this.count,
    this.color,
    this.size,
    this.spacing = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: spacing,
      children: List.generate(
        count,
        (index) => Icon(Icons.star, color: color, size: size),
      ),
    );
  }
}
