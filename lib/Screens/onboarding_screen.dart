import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:practice/Screens/home_screen.dart';
import 'package:practice/Screens/location_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Core/Services/sharedPreferences.dart';
import '../Shared/Components/BottomNavBar.dart';
import '../shared/Components/buttonWidget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../shared/Constants/Variables/Constants.dart';
import 'authentication/signUp_screen.dart';

class onboardingScreen extends StatefulWidget {
  const onboardingScreen({super.key});

  @override
  State<onboardingScreen> createState() => _onboardingScreenState();
}
class _onboardingScreenState extends State<onboardingScreen> {
  late PageController _pageController;
  final PrefService _prefService = PrefService();

  @override
  void initState(){
    _pageController = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }

  _storeOnBoardInfo() async{
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard',isViewed);
  }
  List<Color> color = [
    Color(0XFF0093E9),
    Color(0xffFFCC70),
    Color(0xffFC00FF),
  ];
  int currentContIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              onPageChanged: (index){
                setState(() {
                  currentContIndex=index;
                });
              },
              controller: _pageController,
              children: [
                Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors:[
                          Color(0XFF0093E9),
                          Color(0XFFB721FF),],
                      ),
                    ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Check real-time weather!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize:40,
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
                                          fontSize: 15,
                                          height: 1.5,
                                        ),
                                      ),
                                      const SizedBox(height: 30.0,),
                                      ButtonWidget(
                                        width: 500.0,
                                        height: 50.0,
                                        onClick:(){
                                          _pageController.nextPage(
                                            duration: const Duration(microseconds: 300),
                                            curve: Curves.easeInToLinear,);
                                        },
                                        radius: 30,
                                        child: const Text(
                                          "Next",
                                          style: TextStyle(
                                            fontWeight:FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 25.0,
                                          ),
                                          textAlign: TextAlign.center,

                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                    ),
                      ),
                        ),
                      ],
                    ),
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Get potential weather!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 40.0,
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
                                          fontSize: 15,
                                          height: 1.5,
                                        ),
                                      ),
                                      const SizedBox(height: 30.0,),
                                      ButtonWidget(
                                        width: 500.0,
                                        height: 50.0,
                                        onClick:(){
                                          _pageController.nextPage(
                                            duration: const Duration(microseconds: 300),
                                            curve: Curves.easeInToLinear,);
                                        },
                                        radius: 30,
                                        child: const Text(
                                          "Next",
                                          style: TextStyle(
                                            fontWeight:FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 25.0,
                                          ),
                                          textAlign: TextAlign.center,

                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Get the weather and stay safe!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 40.0,
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
                                          fontSize: 15,
                                          height: 1.5,
                                        ),
                                      ),
                                      const SizedBox(height: 30.0,),
                                      ButtonWidget(
                                        width: 500.0,
                                        height: 50.0,
                                        onClick:() async {
                                          await _storeOnBoardInfo();
                                          if (FirebaseAuth.instance.currentUser != null)
                                          {
                                            _prefService.readCache("location").then((value) {
                                              if (value != null) {
                                                Navigator.push(context, MaterialPageRoute(
                                                  builder: (context) => BottomNavBar(location: value),));
                                              }
                                              else {
                                                Navigator.push(context,
                                                    MaterialPageRoute(builder: (context) => MyLocation(),));
                                              }
                                            });
                                          }
                                          else
                                          {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(builder: (context) => SignUpScreen()),
                                            );
                                          }
                                        },
                                        radius: 30,
                                        child: const Text(
                                          "Get Started",
                                          style: TextStyle(
                                            fontWeight:FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 25.0,
                                          ),
                                          textAlign: TextAlign.center,

                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]
            ),
            Container(
              alignment:  Alignment(0.9,-0.95),
              child: TextButton(
                  onPressed: () async {
                    await _storeOnBoardInfo();
                    if (FirebaseAuth.instance.currentUser != null)
                    {
                      _prefService.readCache("location").then((value) {
                        if (value != null) {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => BottomNavBar(location: value),));
                        }
                        else {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MyLocation(),));
                        }
                      });
                    }
                    else
                    {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    }
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
              ),
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
