import 'package:flutter/material.dart';

class ImageAssetWidget extends StatelessWidget {
  final String imagePath;
  final BoxFit? fit;
  final double? width;
  final double? height;

  /// Width that image will be decoded to in memory.
  /// See [Image] widget documentation for more details.
  /// If not provided and [width] is provided, will be calculated automatically.
  final double? cacheWidth;
  const ImageAssetWidget({
    super.key,
    required this.imagePath,
    this.fit,
    this.width,
    this.height,
    this.cacheWidth,
  });

  @override
  Widget build(BuildContext context) {
    double? cacheWidthResolved = cacheWidth;
    if (cacheWidthResolved == null && width != null) {
      final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
      cacheWidthResolved = width! * devicePixelRatio;
      return Image.asset(
        imagePath,
        fit: fit,
        width: width,
        height: height,
        cacheWidth: cacheWidthResolved.round(),
      );
    }
    return Image.asset(
      imagePath,
      fit: fit,
      width: width,
      height: height,
      cacheWidth: cacheWidthResolved?.round(),
    );
  }
}
