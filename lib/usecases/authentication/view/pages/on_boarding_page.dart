import 'package:sky_nest/common/navigation/routes.dart';
import 'package:sky_nest/common/theme/color_pallete.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(AssetImage('assets/images/on_boarding_1.jpg'), context);
      precacheImage(AssetImage('assets/images/on_boarding_2.jpg'), context);
      precacheImage(AssetImage('assets/images/on_boarding_3.jpg'), context);
    });
  }

  final _pageController = PageController();
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pageViewUi(),
          Positioned(
            bottom: 0,
            child: Container(
              width: screenWidth(context),
              height: screenHeight(context) * 0.32,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
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
                    effect: CustomizableEffect(
                      activeDotDecoration: DotDecoration(
                        width: 70,
                        borderRadius: BorderRadius.circular(20),
                        height: 8,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      dotDecoration: DotDecoration(
                        width: 20,
                        height: 8,
                        color: ColorPallete.grayColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: screenHeight(context) * 0.1,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Easy way to book \n hotels with us',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    child: Text(
                      textAlign: TextAlign.center,
                      'It is a long established fact that a reader will be \n distracted by the readable content.',
                      style: TextStyle(
                        fontSize: 13,
                        color: ColorPallete.grayColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (_currentPageIndex != 0)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                              screenWidth(context) * 0.4,
                              screenHeight(context) * 0.07,
                            ),
                            backgroundColor: ColorPallete.grayColor,
                            foregroundColor: Colors.black,
                          ),
                          onPressed: _back,
                          child: Text('Back'),
                        ),
                      FilledButton(
                        style: FilledButton.styleFrom(
                          fixedSize: Size(
                            screenWidth(context) * 0.4,
                            screenHeight(context) * 0.07,
                          ),
                          // foregroundColor: Colors.white,
                        ),
                        onPressed: _forward,
                        child: Text('Next'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _forward() {
    if ((_currentPageIndex + 1) > 2) {
      context.goNamed(Routes.loginRoute);
    }
    setState(() {
      _currentPageIndex++;
      _pageController.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  void _back() {
    if ((_currentPageIndex - 1) < 0) {
      return;
    }
    setState(() {
      _currentPageIndex--;
      _pageController.previousPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  PageView _pageViewUi() {
    return PageView(
      onPageChanged: (value) {
        setState(() {
          _currentPageIndex = value;
        });
      },
      controller: _pageController,
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorPallete.grayColor1,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/on_boarding_1.jpg'),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: ColorPallete.grayColor,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/on_boarding_2.jpg'),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: ColorPallete.grayColor2,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/on_boarding_3.jpg'),
            ),
          ),
        ),
      ],
    );
  }
}
