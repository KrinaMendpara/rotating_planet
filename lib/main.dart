import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rotating_planet/pageview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Image? earth;
  Image? earth1;
  Image? earth2;
  Image? earth3;

  Image? jupiter;
  Image? jupiter1;
  Image? jupiter2;

  Image? mars;
  Image? mars1;
  Image? mars2;
  Image? mars3;

  Image? mercury;
  Image? mercury1;
  Image? mercury2;

  Image? neptune;
  Image? neptune1;
  Image? neptune2;

  Image? saturn;
  Image? saturn1;
  Image? saturn2;

  Image? uranus;
  Image? uranus1;
  Image? uranus2;

  Image? venus;
  Image? venus1;
  Image? venus2;

  // final List<String> _images = [
  //   'assets/images/earth/earth.png',
  //   'assets/images/earth/earth_back.png',
  //   'assets/images/earth/earth_sky_frame.png',
  //   'assets/images/earth/earth_frame.png',
  //
  //   'assets/images/jupiter/jupiter.png',
  //   'assets/images/jupiter/jupiter_lines.png',
  //   'assets/images/jupiter/jupiter_dots.png',
  //
  //   'assets/images/mars/mars.png',
  //   'assets/images/mars/mars_back.png',
  //   'assets/images/mars/mars_dots.png',
  //   'assets/images/mars/mars_lines.png',
  //
  //   'assets/images/mercury/mercury.png',
  //   'assets/images/mercury/mercury_back.png',
  //   'assets/images/mercury/mercury_dots.png',
  //
  //   'assets/images/neptune/neptune.png',
  //   'assets/images/neptune/neptune_dots.png',
  //   'assets/images/neptune/neptune_lines.png',
  //
  //   'assets/images/saturn/saturn.png',
  //   'assets/images/saturn/saturn_ring.png',
  //   'assets/images/saturn/saturn_lines.png',
  //
  //   'assets/images/uranus/uranus.png',
  //   'assets/images/uranus/uranus_ring.png',
  //   'assets/images/uranus/uranus_lines.png',
  //
  //   'assets/images/venus/venus.png',
  //   'assets/images/venus/venus_lines.png',
  //   'assets/images/venus/venus_dots.png',
  // ];
  // List<ImageProvider<Object>> image= [];
  @override
  void initState() {

    // List.generate(_images.length, (index) => image.add(AssetImage(_images[index])));

    earth = Image.asset('assets/images/earth/earth.png');
    earth1 = Image.asset('assets/images/earth/earth_back.png');
    earth2 = Image.asset('assets/images/earth/earth_frame.png');
    earth3 = Image.asset('assets/images/earth/earth_sky_frame.png');

    jupiter = Image.asset('assets/images/jupiter/jupiter.png');
    jupiter1 = Image.asset('assets/images/jupiter/jupiter_dots.png');
    jupiter2 = Image.asset('assets/images/jupiter/jupiter_lines.png');

    mars = Image.asset('assets/images/mars/mars.png');
    mars1 = Image.asset('assets/images/mars/mars_back.png');
    mars2 = Image.asset('assets/images/mars/mars_dots.png');
    mars3 = Image.asset('assets/images/mars/mars_lines.png');

    mercury = Image.asset('assets/images/mercury/mercury.png');
    mercury1 = Image.asset('assets/images/mercury/mercury_dots.png');
    mercury2 = Image.asset('assets/images/mercury/mercury_back.png');

    neptune = Image.asset('assets/images/neptune/neptune.png');
    neptune1 = Image.asset('assets/images/neptune/neptune_dots.png');
    neptune2 = Image.asset('assets/images/neptune/neptune_lines.png');

    saturn = Image.asset('assets/images/saturn/saturn.png');
    saturn1 = Image.asset('assets/images/saturn/saturn_lines.png');
    saturn2 = Image.asset('assets/images/saturn/saturn_ring.png');

    uranus = Image.asset('assets/images/uranus/uranus.png');
    uranus1 = Image.asset('assets/images/uranus/uranus_lines.png');
    uranus2 = Image.asset('assets/images/uranus/uranus_ring.png');

    venus = Image.asset('assets/images/venus/venus.png');
    venus1 = Image.asset('assets/images/venus/venus_dots.png');
    venus2 = Image.asset('assets/images/venus/venus_lines.png');
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // List.generate(_images.length, (index) => precacheImage(image[index], context));
    precacheImage(earth!.image, context);
    precacheImage(earth1!.image, context);
    precacheImage(earth2!.image, context);
    precacheImage(earth3!.image, context);
    precacheImage(jupiter!.image, context);
    precacheImage(jupiter1!.image, context);
    precacheImage(jupiter2!.image, context);
    precacheImage(mars!.image, context);
    precacheImage(mars1!.image, context);
    precacheImage(mars2!.image, context);
    precacheImage(mars3!.image, context);
    precacheImage(mercury!.image, context);
    precacheImage(mercury1!.image, context);
    precacheImage(mercury2!.image, context);
    precacheImage(neptune!.image, context);
    precacheImage(neptune1!.image, context);
    precacheImage(neptune2!.image, context);
    precacheImage(saturn!.image, context);
    precacheImage(saturn1!.image, context);
    precacheImage(saturn2!.image, context);
    precacheImage(uranus!.image, context);
    precacheImage(uranus1!.image, context);
    precacheImage(uranus2!.image, context);
    precacheImage(venus!.image, context);
    precacheImage(venus1!.image, context);
    precacheImage(venus2!.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      home: const PageViewScreen(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}




