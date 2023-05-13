import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice/Screens/home_screen.dart';
import 'package:practice/Screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/splash_screen.dart';
int? isViewed;

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // SharedPreferences pref=await SharedPreferences.getInstance();
  // isViewed = pref.getInt('onBoard');
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Acme",
      ),
      // themeMode: ThemeMode.system,
      // darkTheme: MyTheme.darkTheme,
      home: SplashScreen(),
    );
  }
}