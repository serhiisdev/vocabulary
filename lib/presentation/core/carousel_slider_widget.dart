import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  final CarouselSliderController? carouselController;
  final int itemCount;
  final ExtendedIndexedWidgetBuilder itemBuilder;
  const CarouselSliderWidget({
    super.key,
    this.carouselController,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return CarouselSlider.builder(
      carouselController: carouselController,
      options: CarouselOptions(
        scrollDirection: Axis.vertical,
        height: height,
        viewportFraction: 1.0,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
