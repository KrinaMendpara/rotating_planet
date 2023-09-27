
import 'package:flutter/material.dart';
import 'package:rotating_planet/widgets/screen.dart';


class MarsScreen extends StatelessWidget {
  const MarsScreen({required this.pageController, required this.currentPage, super.key});
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
            boxColor: const Color(0xFFFECEDA),
            color: const Color(0xFFE31949),
            text: 'Venus',
            subTitleText: 'Earth',
            titleText: 'Mars',
            descriptionText:
              'Mars is the fourth planet and the furthest\n'
              'terrestrial planet from the Sun. The reddish\n'
              'color of its surface is due to finely grained\n'
              'iron(III) oxide dust in the soil, giving it\n'
              'the nickname "the Red Planet". Mars`s radius\n'
              'is second smallest among the planets in\n'
              'the Solar System at 3,389.5 km.',
            backButtonPath: 'assets/images/mars/mars_back.png',
            currentIndex: currentPage,
            pageController: pageController,
          ),
          Positioned(
            bottom: (width < 350 || height < 610) ? 20 : -10,
            height: (width < 350 || height < 610) ? 300 : 400,
            width: (width < 350 || height < 610) ? 300 : 400,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/mars/mars.png',
                  height: (width < 350 || height < 610) ? 300 : 400,
                  width: (width < 350 || height < 610) ? 300 : 400,
                  fit: BoxFit.fill,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: SizedBox(
                    height: (width < 350 || height < 610) ? 160 : 215,
                    width: (width < 350 || height < 610) ? 160 : 215,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Mars(
                        path: 'assets/images/mars/mars_lines.png',
                        reverse: true,
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: SizedBox(
                    height: (width < 350 || height < 610) ? 160 : 215,
                    width: (width < 350 || height < 610) ? 160 : 215,
                    child: Mars(
                        path: 'assets/images/mars/mars_dots.png',
                    ),
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


class Mars extends StatefulWidget {
  Mars({required this.path, super.key, this.reverse=false});

  final String path;
  bool reverse;

  @override
  State<Mars> createState() => _MarsState();
}

class _MarsState extends State<Mars> {
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ListView.builder(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      reverse: widget.reverse,
      itemBuilder: (ctx, i) {
        return Padding(
          padding:  EdgeInsets.only(bottom: widget.reverse?15:0),
          child: Image.asset(
            widget.path,
            fit: BoxFit.fill,
            height: widget.reverse ? 40 : 216,
            width: widget.reverse ? 600 : 3058 * ((width < 350 || height < 610) ? 160 : 215) / 1618,
          ),
        );
      },
    );
  }
}