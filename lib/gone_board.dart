library gone_board;

import 'package:flutter/material.dart';
import 'package:gone_board/pages.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GoneBoard extends StatefulWidget {
  const GoneBoard({super.key});

  @override
  State<GoneBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<GoneBoard> {
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkPrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 6,
            child: PageView(
              controller: pageController,
              onPageChanged: (int page){
                setState(() {
                  currentPage = page;
                });
              },
              children: [
                GonePage(
                  context: context,
                  image: 'assets/onboard_1.png',
                  text: "Stop Making \nLose!",
                  color: Color(0xFFBD3EA1),
                ),
                GonePage(
                  context:  context,
                  image: 'assets/onboard_2.png',
                  text: "Earn More like a \nPro Trader",
                  color: Color(0xFF7C41BE),
                ),
                GonePage(
                  context: context,
                  image: 'assets/onboard_3.png',
                  text: "Get Automated \nLive Signals",
                  color:  Color(0xFF007CC9),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count:  3,
                  axisDirection: Axis.horizontal,
                  effect: SlideEffect(
                      spacing:  7,
                      radius:  100,
                      dotWidth:  31,
                      dotHeight:  6,
                      paintStyle:  PaintingStyle.fill,
                      dotColor:  Color(0xFF2E3458),
                      activeDotColor:  Color(0xFF6C719F)
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16.w),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          currentPage == 2 ? Color(0xFF21AF5A) : Color(0xFF585C83),
                          currentPage == 2 ? Color(0xFF00AAE0) : Color(0xFF29306F),
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: (){
                        if(currentPage == 2){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
                        }else{
                          pageController.nextPage(duration: Duration(milliseconds: 400), curve: Curves.easeInCubic);
                        }
                      },
                      child: Text(
                        currentPage == 2 ? "START" :'NEXT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        minimumSize: Size(
                            MediaQuery.of(context).size.width,
                            60
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
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


