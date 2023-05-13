import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:practice/Core/DataProvider/weatherData.dart';
import 'package:practice/Screens/details_screen.dart';
import 'package:practice/Screens/home_screen.dart';
import 'package:practice/Screens/profile_screen.dart';

class BottomNavBar extends StatefulWidget {

  BottomNavBar({super.key, required this.location});
  String? location;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState(myloc: location);


}
class _BottomNavBarState extends State<BottomNavBar> {
  _BottomNavBarState({required this.myloc});
  String? myloc;
  List<Widget> screens = [];
  var client = WeatherData();
  var data;
  void fetchData() async {
    try
    {
      data = await client.getData(widget.location);
    }
    catch(e)
    {
      print(e);
    }

    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    fetchData();
    screens = [
      HomeScreen(locationController: myloc),
      DetailsScreen(locationController: myloc),
      ProfileScreen(),
    ];
  }

  Color backgroundColor(){
    if(data!=null) {
      try{
        if (data!.condition.toLowerCase().contains('sunny')) {
          return const Color(0xfff1c226);
        } else if (data!.condition.toLowerCase().contains('cloud')) {
          return const Color(0xff354f60);
        } else if (data!.condition.toLowerCase().contains('rain')) {
          return const Color(0xff3878ee);
        }
      }
      catch(e)
    {
      print("Background Problem: $e");
    }

    }
    return const Color(0xff3878ee);
  }
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
            buttonBackgroundColor:  backgroundColor(),
            color:  backgroundColor(),
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