import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:practice/Screens/details_screen.dart';
import 'package:practice/Screens/home_screen.dart';
import 'package:practice/Screens/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List screens = [
    const HomeScreen(),
    const DetailsScreen(),
    const ProfileScreen(),
  ];
  int _selectedIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
            buttonBackgroundColor: const Color(0XFF0093E9),
            color: const Color(0XFF0093E9),
            backgroundColor: Colors.white,
            animationDuration: const Duration(milliseconds: 600),
            height: 60,
            items: const [
              Icon(Icons.home_filled,color: Colors.white),
              Icon(Icons.line_axis_rounded, color: Colors.white),
              Icon(Icons.person_2_rounded, color: Colors.white),
            ],
        onTap: (index){
            setState(() {
              _selectedIndex = index;
            });
        },
      ),
        body: screens[_selectedIndex],
    );
  }
}