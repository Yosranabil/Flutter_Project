import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:practice/Screens/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
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
      nextScreen: const onboardingScreen(),
      splashIconSize: 250,
      duration: 5000000000000000000,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: const Duration(seconds: 2),
      backgroundColor: Colors.deepPurpleAccent,
    );
  }
}
