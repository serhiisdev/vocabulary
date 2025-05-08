import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';
import 'package:vocabulary/app/core/extensions/theme_data_ext.dart';

class BackButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final double size;
  const BackButtonWidget({super.key, this.onPressed, this.size = 24});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? () => context.pop(),
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        size: size,
        color: context.theme.appColors.white,
      ),
    );
  }
}
