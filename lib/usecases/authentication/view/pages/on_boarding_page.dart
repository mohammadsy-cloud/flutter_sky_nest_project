import 'package:demo_project/common/utilities/app_utilities.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              Container(color: Colors.amber),
              Container(color: Colors.green),
              Container(color: Colors.red),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: screenWidth(context),
              height: screenHeight(context) * 0.32,
              decoration: BoxDecoration(
                color: Colors.lime,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: WormEffect(
                      type: WormType.underground,
                      // dotWidth: 50,
                      // spacing: 0,
                      offset: 0.5,
                      dotHeight: 10,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight(context) * 0.1,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Easy way to book \n hotels with us',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      textAlign: TextAlign.center,
                      'It is a long established fact that a reader will be \n distracted by the readable content.',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
