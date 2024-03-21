library gone_board;

import 'package:flutter/material.dart';
import 'package:gone_board/src/pages.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GoneBoard extends StatefulWidget {
  final Color backgroundColor;
  final PageController pageController;
  final Widget onFinishedPage;
  final Color dotColor;
  final Color activeDotColor;
  final String nextText;
  final String startText;
  final TextStyle textStyle;
  final double buttonHeight;
  final Gradient nextButtonGradient;
  final Gradient startButtonGradient;
  final Function(int index)? pageChanged;
  final List<GonePage> items;

  const GoneBoard({super.key,
    required this.pageController,
    required this.onFinishedPage,
    required this.items,

    this.backgroundColor = const Color(0xFF181D4A),
    this.dotColor = const Color(0xFF2E3458),
    this.activeDotColor = const Color(0xFF6C719F),
    this.nextText = 'NEXT',
    this.startText = 'START',
    this.pageChanged,
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    this.buttonHeight = 60,
    this.nextButtonGradient = const LinearGradient(
      colors: [
        Color(0xFF585C83),
        Color(0xFF29306F),
      ],
    ),
    this.startButtonGradient = const LinearGradient(
      colors: [
        Color(0xFF21AF5A),
        Color(0xFF00AAE0),
      ],
    ),
  });


  @override
  State<GoneBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<GoneBoard> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 6,
            child: PageView(
              controller: widget.pageController,
              onPageChanged: (int page){
                setState(() {
                  currentPage = page;
                });
                widget.pageChanged?.call(currentPage);
              },
              children: widget.items.map((e) => e.build()).toList(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: widget.pageController,
                  count:  3,
                  axisDirection: Axis.horizontal,
                  effect: SlideEffect(
                      spacing:  7,
                      radius:  100,
                      dotWidth:  31,
                      dotHeight:  6,
                      paintStyle:  PaintingStyle.fill,
                      dotColor: widget.dotColor,
                      activeDotColor:  widget.activeDotColor,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: currentPage == 2 ?
                      widget.startButtonGradient : widget.nextButtonGradient,
                    ),
                    child: ElevatedButton(
                      onPressed: (){
                        if(currentPage == 2){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget.onFinishedPage));
                        }else{
                          widget.pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInCubic);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        minimumSize: Size(
                            MediaQuery.of(context).size.width,
                            widget.buttonHeight
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        currentPage == 2 ? widget.startText : widget.nextText,
                        style: widget.textStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


