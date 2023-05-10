import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:practice/Screens/search_screen.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../Core/DataProvider/weatherData.dart';
import '../Model/details_model.dart';
import '../shared/Constants/Variables/Constants.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  var client = WeatherData();
  var data;
  info() async{
    data = await client.getData(TextController.text);
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
  String formattedDate = DateFormat('EEEE, MMMM d').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
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
      appBar: _showAppBar? AppBar(
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
      ):null,
        body: NotificationListener<ScrollUpdateNotification>(
            onNotification: (notification) {
              final RenderBox textRenderBox =
              _textKey.currentContext?.findRenderObject() as RenderBox;
              final textTop = textRenderBox.localToGlobal(Offset.zero).dy;
              if (notification.metrics.pixels >= textTop) {
                  setState(() {
                    _showAppBar = true;
                });
              } else {
                setState(() {
                  _showAppBar = false;
              });
              }
          return false;
        },
          child:ListView(
              children: [
               Stack(
          children: [
                  Container(
              height: size.height*0.75,
              width: size.width,
              decoration:  const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors:[Color(0xffa95dee), Color(0xff218bfd)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0,),
                child: Center(
                  child: Column(
                    children: [
                       Text(
                        'Cairo',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 13.0,),
                      Text(
                        'Today, 7 Sep',
                        style: TextStyle(
                          fontSize: 15,
                          //fontWeight: FontWeight.bold,
                          color: Colors.deepPurple.shade100,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10.0,),
                      const Image(
                        image: AssetImage(
                          'Assets/Icons/cloudy.png',
                        ),
                        width: 200.0,
                        height: 200.0,
                      ),
                      const SizedBox(height: 10.0,),
                      const Text(
                        '17°',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10.0,),
                      const Text(
                        'Partly Cloudy',
                        style: TextStyle(
                          fontSize: 20,
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
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Image(
                                            image: AssetImage(
                                              'Assets/Icons/021-sun-2.png',
                                            ),
                                            width: 15.0,
                                            height: 15.0,
                                          ),
                                          const SizedBox(width: 5.0,),
                                          Text(
                                            'Uv index'.toUpperCase(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0,),
                                      const Text(
                                        '0',
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Image(
                                            image: AssetImage(
                                              'Assets/Icons/wind.png',
                                            ),
                                            width: 15.0,
                                            height: 15.0,
                                          ),
                                          const SizedBox(width: 5.0,),
                                          Text(
                                            'Wind'.toUpperCase(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0,),
                                      const Text(
                                        '3 m/s',
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Image(
                                            image: AssetImage(
                                              'Assets/Icons/drop.png',
                                            ),
                                            width: 15.0,
                                            height: 15.0,
                                          ),
                                          const SizedBox(width: 5.0,),
                                          Text(
                                            'Humidity'.toUpperCase(),
                                            style: const TextStyle(
                                              color: Colors.white,

                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0,),
                                      const Text(
                                        '86%',
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
                  Container(
              alignment: Alignment(0.88,0),
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
               SizedBox(height: 8.0,),
                Container(
                  key: _textKey,
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
        // Temperature of each hour
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all( 10.0),
            child: Container(
              decoration: BoxDecoration(
                  color:  Colors.grey[200],
                  borderRadius: BorderRadius.circular(20)
              ),
              child:ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: details.length,
                itemBuilder:(context,index)=> buildDetailsModel(details[index]),
                separatorBuilder: (context,index)=>
                    Column(
                      children: [
                        SizedBox(height: 10.0,),
                        Container(height: 0.1,color: Color(0xed010826),),
                      ],
                    )
                ,
              ),


            ),
          ),
        ),
      ],
         ) ,
        ),
    );

  }
  Widget buildDetailsModel(DetailsModel details)=>Padding(
    padding: const EdgeInsets.all(10.0),
    child: Center(
      child: Row(
        children: [
          Expanded(
            child: Text(
              details.hour,
              style: const TextStyle(
                color: Color(0xff010826),
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Image(
              image: AssetImage(details.imageUrl,),
              width: 60.0,
              height: 60.0,
            ),
          ),
          const SizedBox(height: 10.0,),
          Expanded(
              child: Text(
                '${details.temperature}°',
                style: const TextStyle(
                  color: Color(0xff010826),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              )
          ),

        ],
      ),
    ),
  );
}
