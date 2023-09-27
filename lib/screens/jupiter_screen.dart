import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rotating_planet/widgets/screen.dart';


class JupiterScreen extends StatelessWidget {
  const JupiterScreen({required this.pageController, required this.currentPage, super.key});
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
            boxColor: const Color(0xFFFFEAB2),
            color: const Color(0xFFBA6824),
            text: 'Earth',
            subTitleText: 'Mars',
            titleText: 'Jupiter',
            descriptionText:
              'Jupiter is the fifth planet from the Sun\n'
              'and the largest in the Solar System.\n'
              'It is a gas giant with a mass more than\n'
              'two and a half times that of all the\n'
              'other planets in the Solar System combined,\n'
              'and slightly less than one one-thousandth\n'
              'the mass of the Sun.',
            backButtonPath: 'assets/images/jupiter/jupiter_back.png',
            currentIndex: currentPage,
            pageController: pageController,
          ),
          Positioned(
            bottom: (width < 350 || height < 610) ? 10 : -10,
            height: (width < 350 || height < 610) ? 300 : 400,
            width: (width < 350 || height < 610) ? 300 : 400,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/jupiter/jupiter.png',
                  height: (width < 350 || height < 610) ? 300 : 400,
                  width: (width < 350 || height < 610) ? 300 : 400,
                  fit: BoxFit.fill,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: SizedBox(
                    height:(width < 350 || height < 610) ? 150 : 200,
                    width: (width < 350 || height < 610) ? 150 : 200,
                    child: Transform.rotate(
                      angle: - pi / 9,
                      child: const Jupiter(
                          path: 'assets/images/jupiter/jupiter_lines.png',
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: SizedBox(
                    height: (width < 350 || height < 610) ? 150 : 200,
                    width: (width < 350 || height < 610) ? 150 : 200,
                    child: const Jupiter(path: 'assets/images/jupiter/jupiter_dots.png',reverse: true),
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


class Jupiter extends StatefulWidget {
  const Jupiter({required this.path, super.key, this.reverse=false});

  final String path;
  final bool reverse;

  @override
  State<Jupiter> createState() => _JupiterState();
}

class _JupiterState extends State<Jupiter> {
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
          height: 200,
          width: 1935 * ((width < 350 || height < 610) ? 150 : 200) / 1077,
        );
      },
    );
  }
}

