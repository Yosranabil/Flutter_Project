import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:practice/Screens/details_screen.dart';
import 'package:practice/Screens/home_screen.dart';
import 'package:practice/Screens/profile_screen.dart';

class BottomNavBar extends StatefulWidget {

  BottomNavBar({required this.location});
  String location;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState(myloc: location);


}
class _BottomNavBarState extends State<BottomNavBar> {
  _BottomNavBarState({required this.myloc});
  String myloc;

  List<Widget> screens = [];
  @override
  void initState() {
    super.initState();
    screens = [
      HomeScreen(locationController: myloc),
        DetailsScreen(),
        ProfileScreen(),
    ];
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
            buttonBackgroundColor:  const Color(0xff218bfd),
            color:  const Color(0xff218bfd),
            backgroundColor: Colors.white,
            animationDuration:  const Duration(milliseconds: 600),
            height: 60,
            items:   const [
              Icon(Icons.home_filled,color: Colors.white),
              Icon(Icons.line_axis_rounded, color: Colors.white),
              Icon(Icons.person_rounded, color: Colors.white),
            ],
        onTap: (index){
            setState(() {
              _selectedIndex = index;
            });
        },
      ),
        body: IndexedStack(
          index: _selectedIndex,
          children: screens,
        ),
    );
  }
}