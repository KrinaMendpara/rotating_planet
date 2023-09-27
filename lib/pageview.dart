import 'package:flutter/material.dart';
import 'package:rotating_planet/screens/earth_screen.dart';
import 'package:rotating_planet/screens/jupiter_screen.dart';
import 'package:rotating_planet/screens/mars_screen.dart';
import 'package:rotating_planet/screens/mercury_screen.dart';
import 'package:rotating_planet/screens/neptune_screen.dart';
import 'package:rotating_planet/screens/saturn_screen.dart';
import 'package:rotating_planet/screens/uranus_screen.dart';
import 'package:rotating_planet/screens/venus_screen.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  PageController controller = PageController();

  var currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final list = <Widget>[
      MercuryScreen(currentPage: currentPage, pageController: controller),
      VenusScreen(currentPage: currentPage, pageController: controller),
      EarthScreen(currentPage: currentPage, pageController: controller),
      MarsScreen(currentPage: currentPage, pageController: controller),
      JupiterScreen(currentPage: currentPage, pageController: controller),
      SaturnScreen(currentPage: currentPage, pageController: controller),
      UranusScreen(currentPage: currentPage, pageController: controller),
      NeptuneScreen(currentPage: currentPage, pageController: controller),
    ];
    return PageView.builder(
      onPageChanged: (v) {
        setState(() {
          currentPage = v;
        });
      },
      controller: controller,
      itemBuilder: (ctx, i) {
        final listIndex = i % list.length;
        return list[listIndex];
      },
    );
  }
}
