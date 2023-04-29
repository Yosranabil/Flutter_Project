import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:practice/shared/Components/defaultButton.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/Components/BottomNavBar.dart';

class onboardingScreen extends StatefulWidget {
  const onboardingScreen({super.key});

  @override
  State<onboardingScreen> createState() => _onboardingScreenState();
}

class _onboardingScreenState extends State<onboardingScreen> {
  late PageController _pageController;
  @override
  void initState(){
    _pageController = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispode(){
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: [
                Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors:[Color(0xff283EE8),Color(0xffB721FF),],
                      ),
                    ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Lottie.asset(
                            'Assets/lotties/4800-weather-partly-cloudy.json',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xCC030911),
                            borderRadius: BorderRadius.circular(30),
                          ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  const Text(
                                    'Check real-time weather!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      height: 1.2,
                                    ),
                                  ),
                                  const SizedBox(height: 20.0,),
                                  const Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
                                      'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      height: 1.5,
                                    ),
                                  ),
                                  const SizedBox(height: 30.0,),
                                  defaultButton(
                                    width: 500.0,
                                    height: 50.0,
                                    onPressed:(){
                                      _pageController.nextPage(
                                        duration: const Duration(microseconds: 300),
                                        curve: Curves.easeInToLinear,);
                                    },
                                    text: 'Next',
                                    radius: 30,
                                  ),
                                ],
                              ),
                            ),
                  ),
                    ),
                      ),
                    ],
                  ),
                  ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                        colors: [Color(0xffFFCC70),Color(0xffC850C0),Color(0xff4158D0)]

                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Lottie.asset(
                          'Assets/lotties/4804-weather-sunny.json',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 300.0,
                            decoration: BoxDecoration(
                              color: const Color(0xCC030911),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  const Text(
                                    'Get potential weather!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      height: 1.2,
                                    ),
                                  ),
                                  const SizedBox(height: 20.0,),
                                  const Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
                                      'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      height: 1.5,
                                    ),
                                  ),
                                  const SizedBox(height: 30.0,),
                                  defaultButton(
                                    width: 500.0,
                                    height: 50.0,
                                    onPressed:(){
                                      _pageController.nextPage(
                                        duration: const Duration(microseconds: 300),
                                        curve: Curves.easeInToLinear,);
                                      },
                                    text: 'Next',
                                    radius: 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors:[Color(0xffFC00FF),Color(0xff00DBDE)],
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Lottie.asset(
                          'Assets/lotties/4792-weather-stormshowersday.json',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 300.0,
                            decoration: BoxDecoration(
                              color: const Color(0xCC030911),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  const Text(
                                    'Get the weather and stay safe!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      height: 1.2,
                                    ),
                                  ),
                                  const SizedBox(height: 20.0,),
                                  const Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
                                      'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      height: 1.5,
                                    ),
                                  ),
                                  const SizedBox(height: 30.0,),
                                  defaultButton(
                                    width: 500.0,
                                    height: 50.0,
                                    onPressed:(){
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context)=>BottomNavBar()),
                                      );
                                    },
                                    text: 'Get started',
                                    radius: 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]
            ),
            //Dot Indicator
            Container(
              alignment: const Alignment(0,0.9),
              child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                effect: JumpingDotEffect(
                  activeDotColor: Colors.blueAccent,
                  dotColor: Colors.deepPurple.shade100,
                  dotHeight: 15,
                  dotWidth: 15,
                  spacing: 10,
                  verticalOffset: 20,
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}