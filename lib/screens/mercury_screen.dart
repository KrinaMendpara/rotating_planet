import 'package:flutter/material.dart';
import 'package:rotating_planet/widgets/screen.dart';


class MercuryScreen extends StatelessWidget {
  const MercuryScreen({required this.pageController, required this.currentPage, super.key});
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
            boxColor: const Color(0xFFE6D7FF),
            color: const Color(0xFF705DA6),
            text: 'Uranus',
            subTitleText: 'Neptune',
            titleText: 'Mercury',
            descriptionText:
            'Mercury is the smallest planet in\n'
                'the Solar System and the closest to\n'
                'the Sun. Its orbit around the Sun,\n'
                'takes 87.97 Earth days, the\n'
                'shortest of all the Sun`s planets.',
            backButtonPath: 'assets/images/mercury/mercury_back.png',
            currentIndex: currentPage,
            pageController: pageController,
          ),
          Positioned(
            bottom: (width < 350 || height < 610) ? 50 : 30,
            height: (width < 350 || height < 610) ? 218 : 318,
            width: (width < 350 || height < 610) ? 218 : 318,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/mercury/mercury.png',
                  height: (width < 350 || height < 610) ? 280 : 330,
                  width: (width < 350 || height < 610) ? 280 : 330,
                  fit: BoxFit.fill,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: SizedBox(
                    height: (width < 350 || height < 610) ? 148 : 216,
                    width: (width < 350 || height < 610) ? 148 : 216,
                    child: const Mercury(
                      path: 'assets/images/mercury/mercury_dots.png',
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Mercury extends StatefulWidget {
  const Mercury({required this.path, super.key});

  final String path;

  @override
  State<Mercury> createState() => _MercuryState();
}

class _MercuryState extends State<Mercury> {
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
      itemBuilder: (ctx, i) {
        return Image.asset(
          widget.path,
          fit: BoxFit.cover,
          height: 216,
          width: 2945 * ((width < 350 || height < 610) ? 148 : 216) / 1678,
        );
      },
    );
  }
}





