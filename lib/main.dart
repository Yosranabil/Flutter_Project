import 'package:flutter/material.dart';
import 'package:practice/Screens/onboarding/onboarding_screen.dart';
import 'package:practice/shared/Components/BottomNavBar.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
        home: onboardingScreen(),
    );
  }
}
