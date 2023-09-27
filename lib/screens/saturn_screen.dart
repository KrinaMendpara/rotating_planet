import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rotating_planet/screens/earth_screen.dart';
import 'package:rotating_planet/widgets/screen.dart';

class SaturnScreen extends StatelessWidget {
  const SaturnScreen({required this.pageController, required this.currentPage, super.key});
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
            boxColor: const Color(0xFFF3FFE2),
            color: const Color(0xFF62823A),
            text: 'Mars',
            subTitleText: 'Jupiter',
            titleText: 'Saturn',
            descriptionText:
              'Saturn is the sixth planet from the Sun and\n'
              'the second-largest in the Solar System,\n'
              'after Jupiter. It is a gas giant with an average\n'
              'radius of about nine and a half times that \n'
              'of Earth. It has only one-eighth the average density \n'
              'of Earth, but is over 95 times more massive.',
            backButtonPath: 'assets/images/saturn/saturn_back.png',
            currentIndex: currentPage,
            pageController: pageController,
          ),
          Positioned(
            bottom: (width < 350 || height < 610) ? 20 : -10,
            height: (width < 350 || height < 610) ? 258 : 358,
            width: (width < 350 || height < 610) ? 310 : 410,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/saturn/saturn.png',
                  height: (width < 350 || height < 610) ? 258 :360,
                  width: (width < 350 || height < 610) ? 310 : 410,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  right: (width < 350 || height < 610) ? 92 : 122,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: SizedBox(
                      height: (width < 350 || height < 610) ? 132 : 177,
                      width: (width < 350 || height < 610) ? 132 : 177,
                      child: Transform.rotate(
                        angle:  - pi / 9,
                        child: const Clouds(
                            path: 'assets/images/saturn/saturn_lines.png',
                          reverse: true,
                        ),
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  'assets/images/saturn/saturn_ring.png',
                  height: 380,
                  width: 410,
                  fit: BoxFit.fill,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Saturn extends StatefulWidget {
  const Saturn({required this.path, super.key, this.reverse=false});

  final String path;
  final bool reverse;

  @override
  State<Saturn> createState() => _SaturnState();
}

class _SaturnState extends State<Saturn> {
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
      reverse: widget.reverse,
      padding: EdgeInsets.zero,
      itemBuilder: (ctx, i) {
        return Image.asset(
          widget.path,
          fit: BoxFit.fill,
          height: 100,
          width: 3434  * ((width < 350 || height < 610) ? 132 : 177) / 1124,
        );
      },
    );
  }
}
