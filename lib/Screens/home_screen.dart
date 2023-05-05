import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:practice/Screens/search_screen.dart';

class Day{
  final String time, img;
  bool now;
  int degree;

  Day({required this.time,required this.img, required this.now, required this.degree});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Day> today = [
    Day(
      time: "8:00\nAm",
      img: "Assets/Icons/041-cloudy-6.png",
      now: false,
      degree: 27,
    ),
    Day(
      time: "9:00\nAm",
      img: "Assets/Icons/041-cloudy-6.png",
      now: true,
      degree: 28,
    ),
    Day(
      time: "10:00\nAm",
      img: "Assets/Icons/041-cloudy-6.png",
      now: false,
      degree: 30,
    ),
    Day(
      time: "11:00\nAm",
      img: "Assets/Icons/022-cloudy-3.png",
      now: false,
      degree: 31,
    ),
    Day(
      time: "12:00\nPM",
      img: "Assets/Icons/022-cloudy-3.png",
      now: false,
      degree: 32,
    ),
    Day(
      time: "1:00\nPM",
      img: "Assets/Icons/022-cloudy-3.png",
      now: false,
      degree: 33,
    ),
    Day(
      time: "2:00 PM",
      img: "Assets/Icons/021-sun-2.png",
      now: false,
      degree: 34,
    ),
    Day(
      time: "3:00 PM",
      img: "Assets/Icons/021-sun-2.png",
      now: false,
      degree: 33,
    ),
    Day(
      time: "4:00 PM",
      img: "Assets/Icons/021-sun-2.png",
      now: false,
      degree: 32,
    ),
    Day(
      time: "5:00 PM",
      img: "Assets/Icons/022-cloudy-3.png",
      now: false,
      degree: 31,
    ),
    Day(
      time: "6:00 PM",
      img: "Assets/Icons/022-cloudy-3.png",
      now: false,
      degree: 29,
    ),
    Day(
      time: "7:00 PM",
      img: "Assets/Icons/044-moon.png",
      now: false,
      degree: 28,
    ),
    Day(
      time: "8:00 PM",
      img: "Assets/Icons/044-moon.png",
      now: false,
      degree: 26,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 65,
        leadingWidth: 65,
        leading: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 30,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: 35,
            ),
            Icon(
              Icons.location_on_rounded,
              color: Color.fromRGBO(98, 32, 255, 1),
              size: 27,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Cairo",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions:  const [
          Padding(
            padding: EdgeInsets.all(10,),
            child: InkWell(
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                elevation: 2,
                child: CircleAvatar(
                  radius: 23,
                  backgroundColor: Color.fromRGBO(220, 220, 220,1),
                  child: CircleAvatar(
                    radius: 20,
                    child: Image(
                      image: AssetImage("Assets/Icons/boy.png"),
                    ),
                  ),
                ),
              ),
            ),
          ), //person icon

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 10,
              ),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadiusDirectional.circular(30),
                child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    gradient: LinearGradient(
                      colors: [
                        Color(0XFF21D4FD),
                        Color(0XFFB721FF),
                      ],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft ,
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        bottom: 128,
                        left: 30,
                        child: Column(
                          children: const [
                            Image(
                                image: AssetImage("Assets/Icons/cloudy.png"),
                              height: 170,
                              width: 170,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 210,
                        child: Column(
                          children: const [
                            Text(
                              "21\u00b0",
                              style: TextStyle(
                                fontSize: 98,
                                fontWeight: FontWeight.bold,
                                color: Colors.white54,
                              ),
                            ),
                            Text(
                              "Feels Like 25 \u00b0",
                              style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFEEEEEE),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 120,
                        left: 20,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Rain  Showers",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 26,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Monday, 12 Feb",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              child: Image(
                                  image: const AssetImage("Assets/Icons/wind.png",),
                                  height: 110,
                                  width: 110,
                                  color: Colors.white.withOpacity(0.2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Weekly forecast",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => buildWeekWeather(today[index]),
                      separatorBuilder: (context, index) => const SizedBox(width: 5,),
                      itemCount: today.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }

  Widget buildWeekWeather(Day d) =>
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Material(
              elevation: 5,
              borderRadius: BorderRadiusDirectional.circular(37),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: d.now? const LinearGradient(
                    colors: [
                      Color(0XFF21D4FD),
                      Color(0XFFB721FF),
                    ],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft ,
                  ) : const LinearGradient(colors: [
                    Color.fromRGBO(220, 220, 220, 0.5),
                    Color.fromRGBO(220, 220, 220, 0.5),
                  ]),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      d.time,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: d.now? Colors.white : Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      child: Image(
                        image: AssetImage(d.img),
                        height: 45,
                        width: 45,
                      ),
                    ),
                    Text(
                      "${d.degree}\u00b0",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: d.now? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
