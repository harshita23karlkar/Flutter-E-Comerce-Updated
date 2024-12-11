// Carouser_Slider
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class MyCarouserSlider extends StatefulWidget {
  const MyCarouserSlider({super.key});

  @override
  State<MyCarouserSlider> createState() => _MyCarouserSliderState();
}

class _MyCarouserSliderState extends State<MyCarouserSlider> {
  final _list = [1, 2, 3, 4, 5];
  int currentIndexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 240.0,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndexPage = index;
                });
              },
              autoPlayInterval: const Duration(seconds: 2)),
          items: _list.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 215, 155, 226),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://rukminim2.flixcart.com/fk-p-flap/1620/270/image/262c8a79cd8b80dc.jpg?q=20"),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        DotsIndicator(
          dotsCount: _list.length,
          position: currentIndexPage,
        ),
      ],
    );
  }
}
