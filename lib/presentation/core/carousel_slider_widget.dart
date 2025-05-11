import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatefulWidget {
  final int itemCount;
  final ExtendedIndexedWidgetBuilder itemBuilder;
  const CarouselSliderWidget({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  State<CarouselSliderWidget> createState() => CarouselSliderWidgetState();
}

class CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return CarouselSlider.builder(
      options: CarouselOptions(scrollDirection: Axis.vertical, height: height),
      itemCount: widget.itemCount,
      itemBuilder: widget.itemBuilder,
    );
  }
}
