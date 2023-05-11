import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:practice/Model/dailyForecast.dart';
import 'package:practice/Screens/search_screen.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../Core/DataProvider/weatherData.dart';
import '../Model/details_model.dart';
import '../shared/Constants/Variables/Constants.dart';

class DetailsScreen extends StatefulWidget {
  String locationController;
  DetailsScreen({required this.locationController});
  @override
  State<DetailsScreen> createState() => _DetailsScreenState(loc:locationController);
}

class _DetailsScreenState extends State<DetailsScreen> {
  _DetailsScreenState({required this.loc});
  String loc;
  var client = WeatherData();
  var data;
  var dataDaily;

  String formattedDate = DateFormat('EEEE, MMMM d').format(DateTime.now());
  Future<dynamic> info() async{
    data = await client.getData(loc);
  }
  Future<dynamic> dailyInfo() async{
    dataDaily = await client.getDataDaily(loc);
  }

  List<DetailsModel> details = [
    DetailsModel (
      hour: 'Now',
      imageUrl: 'Assets/Icons/040-cloud-1.png',
      temperature: 17,
    ),
    DetailsModel (
      hour: '3:00 AM',
      imageUrl: 'Assets/Icons/040-cloud-1.png',
      temperature: 18,
    ),
    DetailsModel (
      hour: '4:00 AM',
      imageUrl: 'Assets/Icons/024-cloud-moon.png',
      temperature: 16,
    ),
    DetailsModel (
      hour: '5:00 AM',
      imageUrl: 'Assets/Icons/024-cloud-moon.png',
      temperature: 17,
    ),
    DetailsModel (
      hour: '6:00 AM',
      imageUrl: 'Assets/Icons/041-cloudy-6.png',
      temperature: 18,
    ),
    DetailsModel (
      hour: '7:00 AM',
      imageUrl: 'Assets/Icons/041-cloudy-6.png',
      temperature: 19,
    ),
    DetailsModel (
      hour: '8:00 AM',
      imageUrl: 'Assets/Icons/027-sun-4.png',
      temperature: 22,
    ),
    DetailsModel (
      hour: '9:00 AM',
      imageUrl: 'Assets/Icons/027-sun-4.png',
      temperature: 23,
    ),
  ];
  bool _showAppBar = false;
  final GlobalKey _textKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    print(dataDaily);
    print(data);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
              extendBodyBehindAppBar: true,
              // appBar: AppBar(
              //   backgroundColor: Colors.transparent,
              //   elevation: 0,
              //   actions: [
              //     InkWell(
              //       child: IconButton(
              //         color: Colors.white,
              //         onPressed:(){
              //           showSearch(
              //             context: context,
              //             delegate: MySearchDelegate(),
              //           );
              //         },
              //         icon: const Icon(
              //           Icons.search,
              //           size: 35,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              appBar: _showAppBar ? AppBar(
                backgroundColor: Color(0xffa95dee),
                elevation: 0,
                leading: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                title: const Text(
                  'Weekly Forecast',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ) : null,
              body:
              // NotificationListener<ScrollUpdateNotification>(
              //   onNotification: (notification) {
              //     final RenderBox textRenderBox =
              //     _textKey.currentContext?.findRenderObject() as RenderBox;
              //     final textTop = textRenderBox.localToGlobal(Offset.zero).dy;
              //     if (notification.metrics.pixels >= textTop) {
              //       setState(() {
              //         _showAppBar = true;
              //       });
              //     } else {
              //       setState(() {
              //         _showAppBar = false;
              //       });
              //     }
              //     return false;
              //   },
              FutureBuilder(
                  future: Future.wait( [info(),dailyInfo()]),
                  builder:(context,AsyncSnapshot<List<dynamic>> snapshot){
                    int temp = data?.temp.toInt() ?? 0;
                    if(snapshot.connectionState == ConnectionState.done) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: size.height * 0.75,
                                  width: size.width,
                                  decoration:  BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: backgroundColor(),
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 50.0,),
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            '${data?.cityName}',
                                            style: TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 13.0,),
                                          Text(
                                            formattedDate,
                                            style: TextStyle(
                                              fontSize: 15,
                                              //fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 10.0,),
                                          Image(
                                            image: (WeatherIcons[data?.condition] !=
                                                null)
                                                ? AssetImage(
                                                "${WeatherIcons[data?.condition]}")
                                                : const AssetImage(
                                                'Assets/Icons/cloudy.png'),
                                            width: 200.0,
                                            height: 200.0,
                                          ),
                                          const SizedBox(height: 10.0,),
                                          Text(
                                            '$temp\u00b0',
                                            style: TextStyle(
                                              fontSize: 60,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 20.0,),
                                          Text(
                                            '${data?.condition}',
                                            style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          // Temperature status
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(
                                                        30)
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment
                                                                .center,
                                                            children: [
                                                              const Image(
                                                                image: AssetImage(
                                                                  'Assets/Icons/021-sun-2.png',
                                                                ),
                                                                width: 15.0,
                                                                height: 15.0,
                                                              ),
                                                              const SizedBox(
                                                                width: 5.0,),
                                                              Text(
                                                                'Uv index'.toUpperCase(),
                                                                style: const TextStyle(
                                                                  color: Colors.white,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(height: 5.0,),
                                                          Text(
                                                            '${data?.uv}',
                                                            style: TextStyle(
                                                              fontSize: 20.0,
                                                              color: Colors.white,
                                                            ),
                                                            textAlign: TextAlign.center,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 0.5,
                                                      height: 45.0,
                                                      decoration: const BoxDecoration(
                                                        color: Colors.white,

                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment
                                                                .center,
                                                            children: [
                                                              const Image(
                                                                image: AssetImage(
                                                                  'Assets/Icons/wind.png',
                                                                ),
                                                                width: 15.0,
                                                                height: 15.0,
                                                              ),
                                                              const SizedBox(
                                                                width: 5.0,),
                                                              Text(
                                                                'Wind'.toUpperCase(),
                                                                style: const TextStyle(
                                                                  color: Colors.white,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(height: 5.0,),
                                                          Text(
                                                            '${data?.wind} k/h',
                                                            style: TextStyle(
                                                              fontSize: 20.0,
                                                              color: Colors.white,

                                                            ),
                                                            textAlign: TextAlign.center,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 0.5,
                                                      height: 45.0,
                                                      decoration: const BoxDecoration(
                                                          color: Colors.white
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment
                                                                .center,
                                                            children: [
                                                              const Image(
                                                                image: AssetImage(
                                                                  'Assets/Icons/drop.png',
                                                                ),
                                                                width: 15.0,
                                                                height: 15.0,
                                                              ),
                                                              const SizedBox(
                                                                width: 5.0,),
                                                              Text(
                                                                'Humidity'
                                                                    .toUpperCase(),
                                                                style: const TextStyle(
                                                                  color: Colors.white,

                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(height: 5.0,),
                                                          Text(
                                                            '${data?.humidity}%',
                                                            style: TextStyle(
                                                              fontSize: 20.0,
                                                              color: Colors.white,
                                                            ),
                                                            textAlign: TextAlign.center,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                               // Search Icon
                                Container(
                                  alignment: Alignment(0.88,.9),
                                  child: InkWell(
                                    child: IconButton(
                                      color: Colors.white,
                                      onPressed:(){
                                        showSearch(
                                          context: context,
                                          delegate: MySearchDelegate(),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.search,
                                        size: 35,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.0,),
                            Container(
                              //key: _textKey,
                              child: const Text(
                                'Weekly Forecast',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                  color: Color(0xff010826),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            // weekly forecast
                            ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount:dataDaily.length ,
                              itemBuilder: (context, index) =>buildDetailsModel(context,index),
                              separatorBuilder: (context, index) =>
                                  Column(
                                    children: [
                                      SizedBox(height: 10.0,),
                                      Container(height: 0.1, color: Color(0xed010826),),
                                    ],
                                  )
                              ,
                            ),
                          ],
                        ),
                      );
                    }
                    else if(snapshot.connectionState == ConnectionState.waiting)
                    {
                      return  const Center(child: CircularProgressIndicator(),);
                    }
                    return Container();
                  }
              ),
            );
  }

  List<Color> backgroundColor(){
    if(data!.condition.toLowerCase().contains('sunny')){
      return [Color(0xfff1c226),Color(0xfffd7502)];
    }else if(data!.condition.toLowerCase().contains('cloud')){
      return [Color(0xff354f60), Color(0xff506e81)];
    }else if(data!.condition.toLowerCase().contains('rain')){
      return [Color(0xff3878ee),Color(0xff218bfd),];
    }
    return [Color(0XFF21D4FD),Color(0XFFB721FF),];
  }
  Widget buildDetailsModel(context,index){
    var dateTime = DateTime.parse(dataDaily[index].date);
    var dayName = DateFormat('EEEE', 'en_US').format(dateTime);
    var today= DateTime.now();
    var tomorrow = today.add(Duration(days: 1));
    var formattedDateTime = DateFormat('yyyy-MM-dd').format(dateTime);
    var formattedTomorrow = DateFormat('yyyy-MM-dd').format(tomorrow);
    var formattedToday = DateFormat('yyyy-MM-dd').format(today);


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                formattedDateTime==formattedToday ? 'Today' : formattedDateTime == formattedTomorrow ? 'Tomorrow'
                    : dayName,
                style: const TextStyle(
                  color: Color(0xff010826),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                //textAlign: TextAlign.center,
              ),
            ),
            SizedBox(width: 10.0,),
            Expanded(
              child: Row(
                children: [
                  const Image(
                    image: AssetImage('Assets/Icons/umbrella.png',),
                    width: 15.0,
                    height: 15.0,),
                  SizedBox(width: 3.0,),
                  Text('${dataDaily[index].rainChance}%')
                ],
              ),
            ),
            Expanded(
              child: Image.network(
                'https:${dataDaily?[index].maxIcon}',
                width: 30.0,
                height: 30.0,
              ),
            ),
            Expanded(
              child: Image.network(
                'https:${dataDaily?[index].minIcon}',
                width: 30.0,
                height: 30.0,
              ),
            ),
            Expanded(
              child: Text(
                '${dataDaily[index].maxTemp}°',
                style: const TextStyle(
                  color: Color(0xff010826),
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                '${dataDaily[index].minTemp}°',
                style: const TextStyle(
                  color: Color(0xff010826),
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
