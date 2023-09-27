import 'package:flutter/material.dart';


class Screen extends StatefulWidget {

  const Screen({
    required this.pageController,
    required this.currentIndex,
    required this.boxColor,
    required this.color,
    required this.text,
    required this.subTitleText,
    required this.titleText,
    required this.descriptionText,
    required this.backButtonPath,
    super.key,
  });
  final int currentIndex;
  final Color boxColor;
  final Color color;
  final String text;
  final String subTitleText;
  final String titleText;
  final String descriptionText;
  final String backButtonPath;
  final PageController pageController;

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

  @override
  Widget build(BuildContext context) {
    final  height = MediaQuery.of(context).size.height;
    final  width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: height - 150,
            width: width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              color: widget.boxColor,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 100),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 300,
                  width: 250,
                  child: Column(
                    children: [
                      Text(
                        widget.text,
                        style: TextStyle(
                            color: widget.color.withOpacity(0.3),
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          widget.subTitleText,
                          style: TextStyle(
                              color: widget.color.withOpacity(0.5),
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Text(
                        widget.titleText,
                        style: TextStyle(
                            color: widget.color,
                            fontSize: 50,
                            fontWeight: FontWeight.w800,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            widget.descriptionText,
                            textAlign: TextAlign.center,
                            // maxLines: 7,
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15,
                                color: widget.color,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 30,
            height: 80,
            width: 100,
            child: IconButton(
              icon: Image.asset(
                widget.backButtonPath,
                height: 80,
                width: 100,
              ),
              onPressed: () {
                widget.pageController.animateToPage(
                  widget.currentIndex+1,
                  duration: const Duration(milliseconds: 10),
                  curve: Curves.easeIn,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
