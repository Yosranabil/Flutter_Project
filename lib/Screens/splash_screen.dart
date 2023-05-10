import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:practice/Screens/home_screen.dart';
import 'package:practice/Screens/onboarding/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'authentication/signUp_screen.dart';
import 'location_screen.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  int? isViewed;
  onBoardRun() async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    isViewed = prefs.getInt('onBoard');
    return isViewed;
  }
  @override
  Widget build(BuildContext context) {
    onBoardRun();
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Lottie.asset(
            'Assets/lotties/99280-beezhive-splash-loading-animation.json',
            height: 203,
            width: 400,
          ),
          DefaultTextStyle(
          style: const TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
          child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText('Forecastly'),
              ],
          ),
        ),
        ],
      ),
      nextScreen: isViewed !=0? const onboardingScreen() :
      (FirebaseAuth.instance.currentUser != null)?
      MyLocation(): const SignUpScreen(),
      splashIconSize: 250,
      duration: 5000,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: const Duration(seconds: 2),
      backgroundColor: Colors.deepPurpleAccent,
    );
  }
}
