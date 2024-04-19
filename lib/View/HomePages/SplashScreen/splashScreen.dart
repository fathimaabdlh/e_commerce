// ore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:main_project_/View/HomePages/SplashScreen/splashOne.dart';
import 'package:main_project_/View/HomePages/SplashScreen/splashThree.dart';
import 'package:main_project_/View/HomePages/SplashScreen/splashTwo.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatelessWidget {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            // page view
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: PageView(
                controller: _controller,
                children: const [
                  Page1(),
                  Page2(),
                  Page3(),
                  // Page4(),
                ],
              ),
            ),
            //  SizedBox(height: 50,),
            // dot indicators
            Positioned(
              top: 800,
              left: 150,
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: JumpingDotEffect(
                  activeDotColor: Colors.deepPurple,
                  dotColor: Colors.deepPurple.shade100,
                  dotHeight: 20,
                  dotWidth: 20,
                  spacing: 16,
                  //verticalOffset: 50,
                  jumpScale: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
