import 'package:flutter/material.dart';
import 'package:rotating_planet/widgets/screen.dart';

class EarthScreen extends StatefulWidget {
  const EarthScreen({required this.pageController,required this.currentPage, super.key});
  final PageController pageController;
  final int currentPage;
  @override
  State<EarthScreen> createState() => _EarthScreenState();
}

class _EarthScreenState extends State<EarthScreen> {
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
            boxColor: const Color(0xFFD9F9FE),
            color: const Color(0xFF228EA9),
            text: 'Mercury',
            subTitleText: 'Venus',
            titleText: 'Earth',
            descriptionText:
              'Earth is the third planet from the Sun.\n'
                'While Earth may not contain the largest \n '
                'volumes of water  in the Solar System,\n '
                'only Earth sustains liquid surface \n'
                'water, extending over 70.8% of the \n'
                'Earth with its ocean, making Earth an \n '
                'ocean world.',
            backButtonPath: 'assets/images/earth/earth_back.png',
            currentIndex: widget.currentPage,
            pageController: widget.pageController,
          ),
          Positioned(
            bottom:(width < 350 || height < 610) ? 70 : 30,
            height: (width < 350 || height < 610) ? 200 : 300,
            width: (width < 350 || height < 610) ? 200 : 300,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/earth/earth.png',
                  height: (width < 350 || height < 610) ? 200 : 300,
                  width: (width < 350 || height < 610) ? 200 : 300,
                  fit: BoxFit.fill,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: SizedBox(
                    height: (width < 350 || height < 610) ? 157 : 237,
                    width: (width < 350 || height < 610) ? 157 : 237,
                    child: const Clouds(path: 'assets/images/earth/earth_frame.png'),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: SizedBox(
                    height: (width < 350 || height < 610) ? 157 : 237,
                    width: (width < 350 || height < 610) ? 157 : 237,
                    child: const Clouds(path: 'assets/images/earth/earth_sky_frame.png',reverse: true),
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

class Clouds extends StatefulWidget {
  const Clouds({required this.path, super.key, this.reverse=false});

  final String path;
  final bool reverse;

  @override
  State<Clouds> createState() => _CloudsState();
}

class _CloudsState extends State<Clouds> {
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
          height: 237,
          width: 3670 * ((width < 350 || height < 550) ? 157 : 237) / 1189,
        );
      },
    );
  }
}
