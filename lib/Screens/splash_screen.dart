import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:practice/Core/Services/sharedPreferences.dart';
import 'package:practice/Screens/onboarding/onboarding_screen.dart';
import 'package:practice/Shared/Components/BottomNavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'authentication/signUp_screen.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {


  final PrefService _prefService = PrefService();
  var result;
  int? isViewed;

  onBoardRun() async{
    result = await _prefService.readCache("location_");
    SharedPreferences prefs =await SharedPreferences.getInstance();
    isViewed = prefs.getInt('onBoard');
    return isViewed;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    Future.delayed(const Duration(seconds: 10)).then((value){
      nextPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    onBoardRun();
    return Container(
      color: Colors.deepPurpleAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
              totalRepeatCount: 3,
              animatedTexts: [
                TyperAnimatedText('Forecastly'),
              ],
            ),
          ),
        ],
      ),
    );

  }
  Future<void> nextPage() async {
    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavBar(location: result),
        ),
      );
    } else {
      if (isViewed == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUpScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => onboardingScreen(),
          ),
        );
      }
    }
  }
}

