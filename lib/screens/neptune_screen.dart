import 'package:flutter/material.dart';
  import 'package:rotating_planet/widgets/screen.dart';


class NeptuneScreen extends StatelessWidget {
  const NeptuneScreen({required this.pageController, required this.currentPage, super.key});
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
            boxColor: const Color(0xFFDBF2FF),
            color: const Color(0xFF367FE8),
            text: 'Saturn',
            subTitleText: 'Uranus',
            titleText: 'Neptune',
            descriptionText:
            'Neptune is the eighth planet from the Sun and\n'
            'the farthest known planet in the Solar System.\n'
            'It is the fourth-largest planet in the Solar\n'
            'System by diameter, the third-most-massive\n'
            'planet, and the densest giant planet. It is 17\n'
            'times the mass of Earth, and slightly more\n'
            'massive than its near-twin Uranus.',
            backButtonPath: 'assets/images/neptune/neptune_back.png',
            currentIndex: currentPage,
            pageController: pageController,
          ),
          Positioned(
            bottom:(width < 350 || height < 610) ? 10 : -10,
            height: (width < 350 || height < 610) ? 300 : 400,
            width: (width < 350 || height < 610) ? 300 : 400,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/neptune/neptune.png',
                  height: (width < 350 || height < 610) ? 300 : 400,
                  width: (width < 350 || height < 610) ? 300 : 400,
                  fit: BoxFit.fill,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: SizedBox(
                    height: (width < 350 || height < 610) ? 150 : 200,
                    width: (width < 350 || height < 610) ? 150 : 200,
                    child: const Neptune(path: 'assets/images/neptune/neptune_lines.png'),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: SizedBox(
                    height: (width < 350 || height < 610) ? 150 :  200,
                    width: (width < 350 || height < 610) ? 150 : 200,
                    child: const Neptune(path: 'assets/images/neptune/neptune_dots.png',reverse: true),
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

class Neptune extends StatefulWidget {
  const Neptune({required this.path, super.key, this.reverse=false});

  final String path;
  final bool reverse;

  @override
  State<Neptune> createState() => _NeptuneState();
}

class _NeptuneState extends State<Neptune> {
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
    return ListView.builder(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      reverse: widget.reverse,
      itemBuilder: (ctx, i) {
        return Image.asset(
          widget.path,
          fit: BoxFit.fill,
          height: 400,
          width: 500,
        );
      },
    );
  }
}