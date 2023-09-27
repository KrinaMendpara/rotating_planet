import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rotating_planet/screens/earth_screen.dart';
import 'package:rotating_planet/widgets/screen.dart';


class UranusScreen extends StatelessWidget {
  const UranusScreen({required this.pageController, required this.currentPage, super.key});
  final PageController pageController;
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Screen(
            boxColor: const Color(0xFFDDCDFF),
              color: const Color(0xCD5D2FE4),
              text: 'Jupiter',
              subTitleText: 'Saturn',
              titleText: 'Uranus',
              descriptionText:
                'The seventh planet from the Sun with the third \n'
                'largest diameter in our solar system,\n'
                'Uranus is very cold and windy. The ice giant\n'
                'is surrounded by 13 faint rings and 27\n'
                'small moons as it rotates at a nearly 90-degree\n'
                'angle from the plane of its orbit.',
              backButtonPath: 'assets/images/uranus/uranus_back.png',
            currentIndex: currentPage,
            pageController: pageController,
            ),
          Positioned(
            bottom: (width < 350 || height < 610) ? 10 : -10,
            height:(width < 350 || height < 610) ? 300 : 400,
            width: (width < 350 || height < 610) ? 340 : 460,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left : 3.5,
                  child: Image.asset(
                    'assets/images/uranus/uranus.png',
                    height: (width < 350 || height < 610) ? 300 : 400,
                    width: (width < 350 || height < 610) ? 340 : 460,
                    fit: BoxFit.fill,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(160),
                  child: SizedBox(
                    height: (width < 350 || height < 610) ? 150 :  200,
                    width: (width < 350 || height < 610) ? 150 : 200,
                    child: Transform.rotate(
                      angle: -pi / 3,
                      child: const Clouds(
                          path: 'assets/images/uranus/uranus_lines.png',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: (width < 300 || height < 550) ? 10 : 10),
                  child: Image.asset(
                    'assets/images/uranus/uranus_ring.png',
                    height: (width < 350 || height < 610) ? 240 : 325,
                    width: (width < 350 || height < 610) ? 190 : 240,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


class Uranus extends StatefulWidget {
  const Uranus({required this.path, super.key, this.reverse=false});

  final String path;
  final bool reverse;

  @override
  State<Uranus> createState() => _UranusState();
}

class _UranusState extends State<Uranus> {
  late ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.animateTo(scrollController.offset + 200,
          duration: const Duration(milliseconds: 20000), curve: Curves.easeOut,);
    });
    scrollController.addListener(() {
      scrollController.animateTo(scrollController.offset + 200,
          duration: const Duration(milliseconds: 20000), curve: Curves.easeOut,);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ListView.builder(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      reverse: widget.reverse,
      itemBuilder: (ctx, i) {
        return Image.asset(
          widget.path,
          fit: BoxFit.fill,
          height: 100,
          width: 3090 * ((width < 400 && height < 610) ? 162 :  200) / 830,
        );
      },
    );
  }
}
