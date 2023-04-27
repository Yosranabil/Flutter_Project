import 'package:flutter/material.dart';
import 'package:practice/Constants/Components/BottomNavBar.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
        home: BottomNavBar(),
    );
  }
}
