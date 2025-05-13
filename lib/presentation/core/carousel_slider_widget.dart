import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  final CarouselSliderController? carouselController;
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;
  final int itemCount;
  final ExtendedIndexedWidgetBuilder itemBuilder;
  const CarouselSliderWidget({
    super.key,
    this.carouselController,
    this.onPageChanged,
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
        onPageChanged: onPageChanged,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
