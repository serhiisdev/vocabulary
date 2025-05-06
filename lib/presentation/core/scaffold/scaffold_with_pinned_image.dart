import 'package:flutter/material.dart';
import 'package:vocabulary/app/core/extensions/build_context_ext.dart';
import 'package:vocabulary/app/core/extensions/theme_data_ext.dart';
import 'package:vocabulary/app/gen/assets.gen.dart';
import 'package:vocabulary/presentation/core/image_asset_widget.dart';

class ScaffoldWithPinnedImage extends StatelessWidget {
  final String assetImagePath;
  final double imageHeightFactor;
  final Widget? floatingActionButton;
  final Widget body;
  const ScaffoldWithPinnedImage({
    super.key,
    required this.assetImagePath,
    this.imageHeightFactor = 0.45,
    this.floatingActionButton,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = context.screenSize;
    final imageHeight = screenSize.height * imageHeightFactor;
    const bodyBorderRadius = 12.0;

    /// Place body at the bottom of the image
    final bodyStartDy = imageHeight - (bodyBorderRadius * 2);

    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Use [SingleChildScrollView] to ensure that user is able to scroll content,
          // if content is bigger than screen height, for example when system font size is increased.
          return SingleChildScrollView(
                child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            // To make possible usage of [Expanded] or [Spacer] widgets inside [Column].
            child: IntrinsicHeight(
              child: Stack(
                  fit: StackFit.passthrough,
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: ImageAssetWidget(
                        imagePath: Assets.images.letters.path,
                        fit: BoxFit.cover,
                        height: imageHeight,
                        width: screenSize.width,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: bodyStartDy),
                        Expanded(
                          child: _RoundedCornersContainer(
                            bodyBorderRadius: bodyBorderRadius,
                            child: body,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _RoundedCornersContainer extends StatelessWidget {
  final double bodyBorderRadius;
  final Widget child;
  const _RoundedCornersContainer({
    required this.bodyBorderRadius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.appColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(bodyBorderRadius),
          topRight: Radius.circular(bodyBorderRadius),
        ),
      ),
      child: child,
    );
  }
}
