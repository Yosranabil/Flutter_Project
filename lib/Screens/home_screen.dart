import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:practice/Core/DataProvider/weatherData.dart';
import 'package:practice/Screens/location_screen.dart';
import 'package:practice/shared/Constants/Variables/Constants.dart';

class HomeScreen extends StatefulWidget {
  String? locationController;
  HomeScreen({required this.locationController});

  @override
  State<HomeScreen> createState() => _HomeScreenState(loc: locationController);
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState({required this.loc});
  String? loc;
  var client = WeatherData();
  var data;
  String formattedDate = DateFormat('EEEE, MMMM d').format(DateTime.now());

  info() async {
    data = await client.getData(loc);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: info(),
        builder: (context, snapshot) {
          int temp;
          try {
            temp = data?.temp.toInt() ?? 0;
          } catch (e) {
            print("Temprature Conversion Null: $e");
            temp = 0;
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.location_city_rounded,
                    ),
                    color: iconColor(),
                    iconSize: 30,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyLocation(),
                          ));
                    },
                  ),
                ),
                toolbarHeight: 65,
                leadingWidth: 65,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: iconColor(),
                      size: 27,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${data?.cityName}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                       color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                centerTitle: true,
                actions: const [
                  Padding(
                    padding: EdgeInsets.all(
                      10,
                    ),
                    child: InkWell(
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        elevation: 2,
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor: Color.fromRGBO(220, 220, 220, 1),
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
                        vertical: 50,
                        horizontal: 10,
                      ),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadiusDirectional.circular(30),
                        child: Container(
                          width: double.infinity,
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                            gradient: LinearGradient(
                              colors: backgroundColor(),
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                            ),
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                bottom: 90,
                                child: Column(
                                  children: [
                                    Image(
                                      image: (WeatherIcons[data?.condition] !=
                                          null)
                                          ? AssetImage(
                                          "${WeatherIcons[data?.condition]}")
                                          : const AssetImage(
                                          'Assets/Icons/cloudy.png'),
                                      height: 210,
                                      width: 210,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 10,
                                child: Column(
                                  children: [
                                    Text(
                                      "$temp\u00b0",
                                      style: const TextStyle(
                                        fontSize: 98,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white54,
                                      ),
                                    ),
                                    Text(
                                      "Feels Like ${data?.feels_like}\u00b0",
                                      style: const TextStyle(
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
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "${data?.condition}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 26,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          formattedDate,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 17,
                                      ),
                                      child: Image(
                                        image: const AssetImage(
                                          "Assets/Icons/wind.png",
                                        ),
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
                            "Today's forecast",
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
                              itemBuilder: (context, index) =>
                                  buildHourlyForecast(index),
                              separatorBuilder: (context, index) =>
                              const SizedBox(
                                width: 5,
                              ),
                              itemCount: data.hours.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                        vertical: 20,
                      ),
                      child: Divider(
                        thickness: 1,
                        color: Color.fromRGBO(220, 220, 220, 1),
                        indent: 20,
                        endIndent: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 10,
                        end: 10,
                        bottom: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Wind",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadiusDirectional.circular(30),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 220,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: backgroundColor(),
                                      begin: Alignment.bottomRight,
                                      end: Alignment.topLeft,
                                    ),
                                    borderRadius:
                                    const BorderRadiusDirectional.all(
                                        Radius.circular(30)),
                                  ),
                                ),
                                Positioned(
                                  bottom: 5,
                                  right: 40,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            'Direction:   ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            '${data?.wind_dir}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Speed:   ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            '${data?.wind} k/h',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 35,
                                          ),
                                          Image(
                                            image: const AssetImage(
                                              "Assets/Icons/wind.png",
                                            ),
                                            height: 110,
                                            width: 110,
                                            color:
                                            Colors.white.withOpacity(0.2),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: -60,
                                  child: Lottie.asset(
                                    'Assets/lotties/15422-wind-mill-animation.json',
                                    width: 300,
                                    height: 300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error!'),
            );
          }
          return const Text('error happened');
        });
  }

  List<Color> backgroundColor() {
    try {
      if (data!.condition.toLowerCase().contains('sunny')) {
        return [Color(0xfff1c226), Color(0xfffd7502)];
      } else if (data!.condition.toLowerCase().contains('cloud')) {
        return [Color(0xff354f60), Color(0xff506e81)];
      } else if (data!.condition.toLowerCase().contains('rain')) {
        return [
          Color(0xff3878ee),
          Color(0xff218bfd),
        ];
      }else if (data!.condition.toLowerCase().contains('clear')) {
        return [
          Color(0xff85adf8),
          Color(0xff5890cc),
        ];
      }
    } catch (e) {
      print("BackColor Problem: $e");
    }

    return [
      Color(0XFF21D4FD),
      Color(0XFFB721FF),
    ];
  }

  Color iconColor() {
    try {
      if (data != null) {
        if (data!.condition.toLowerCase().contains('sunny')) {
          return const Color(0xfff1c226);
        } else if (data!.condition.toLowerCase().contains('cloud')) {
          return const Color(0xff354f60);
        } else if (data!.condition.toLowerCase().contains('rain')) {
          return const Color(0xff3878ee);
        }else if (data!.condition.toLowerCase().contains('clear')) {
          return const Color(0xff5890cc);
        }
      }
    } catch (e) {
      print("IconColor Problem: $e");
    }
    return Colors.deepPurple;
  }

  Widget buildHourlyForecast(int i) {
    DateTime dateTime = DateTime.parse(data.hours[i]['time'].toString());
    String timeString = DateFormat('h:mm a').format(dateTime);
    int temp = data.hours[i]['temp_c'].toInt() ?? 0;
    bool isCurrentHour = dateTime.hour == DateTime.now().hour;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Material(
            elevation: 5,
            borderRadius: BorderRadiusDirectional.circular(40),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: isCurrentHour
                    ? LinearGradient(
                  colors: backgroundColor(),
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                )
                    : const LinearGradient(colors: [
                  Color.fromRGBO(220, 220, 220, 1),
                  Color.fromRGBO(220, 220, 220, 1),
                ]),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      timeString,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: isCurrentHour ? Colors.white : Colors.black,
                      ),
                    ),
                    FutureBuilder(
                      future: info(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Image(
                            image: (WeatherIcons[data?.hours[0]['condition']
                            ['text']] !=
                                null)
                                ? AssetImage(WeatherIcons[data?.hours[0]
                            ['condition']['text']]!)
                                : const AssetImage('Assets/Icons/cloudy.png'),
                            height: 70,
                            width: 70,
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                    Text(
                      "$temp\u00b0",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isCurrentHour ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}