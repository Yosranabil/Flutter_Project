import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice/Screens/onboarding/onboarding_screen.dart';
import 'package:practice/shared/Components/BottomNavBar.dart';

import 'Screens/details_screen.dart';
import 'Screens/splash_screen.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: BottomNavBar(),
    );
  }
}
