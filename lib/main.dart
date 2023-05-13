import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice/Screens/home_screen.dart';
import 'package:practice/Screens/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Core/ThemeProvider/theme/theme_provider.dart';
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
  Widget build(BuildContext context) =>ChangeNotifierProvider(
      create: (context)=>ThemeProvider(),
      builder: (context,_){
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          darkTheme: MyTheme.darkTheme,
          theme: MyTheme.lightTheme,
          home: SplashScreen(),
        );
      }
  );
}