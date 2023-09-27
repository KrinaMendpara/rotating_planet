
import 'package:flutter/material.dart';
import 'package:rotating_planet/widgets/screen.dart';

class VenusScreen extends StatelessWidget {
  const VenusScreen({required this.pageController, required this.currentPage, super.key});
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
            color: const Color(0xFFFC7100),
            text: 'Neptune',
            subTitleText: 'Mercury',
            titleText: 'Venus',
            descriptionText:
              'Venus is the second planet from the Sun.\n'
              'It is a rocky planet with the densest\n'
              'atmosphere of all the rocky bodies in\n'
              'the Solar System, and the only one with a\n'
              'mass and size that is close to that of\n'
              'its orbital neighbour Earth.',
            backButtonPath: 'assets/images/venus/venus_back.png',
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
                  'assets/images/venus/venus.png',
                  height: (width < 350 || height < 610) ? 300 : 400,
                  width: (width < 350 || height < 610) ? 300 : 400,
                  fit: BoxFit.fill,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: SizedBox(
                    height: (width < 350 || height < 610) ? 150 : 200,
                    width: (width < 350 || height < 610) ? 150 : 200,
                    child: const Venus(
                        path: 'assets/images/venus/venus_lines.png',
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: SizedBox(
                    height: (width < 350 || height < 610) ? 150 : 200,
                    width: (width < 350 || height < 610) ? 150 : 200,
                    child: const Venus(path: 'assets/images/venus/venus_dots.png',reverse: true),
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

class Venus extends StatefulWidget {
  const Venus({required this.path, super.key, this.reverse = false});

  final String path;
  final bool reverse;

  @override
  State<Venus> createState() => _VenusState();
}

class _VenusState extends State<Venus> {
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
        return Image.asset(
          widget.path,
          fit: BoxFit.fill,
          height: 200,
          width: 2498 * ((width < 350 || height < 610) ? 150 : 200) / 1424,
        );
      },
    );
  }
}