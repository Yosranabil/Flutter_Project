import 'package:flutter/material.dart';
import 'package:practice/Screens/search_screen.dart';

import '../Model/details_model.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
          children: [
            Container(
              height: size.height*0.75,
              width: size.width,
              decoration:  BoxDecoration(
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
                padding: const EdgeInsets.only(top: 50.0,),
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
                      SizedBox(height: 13.0,),
                      Text(
                        'Today, 7 Sep',
                        style: TextStyle(
                          fontSize: 15,
                          //fontWeight: FontWeight.bold,
                          color: Colors.deepPurple.shade100,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10.0,),
                      Image(
                        image: AssetImage(
                          'Assets/Icons/cloudy.png',
                        ),
                        width: 200.0,
                        height: 200.0,
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                        '17°',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10.0,),
                      Text(
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
                                          Image(
                                            image: AssetImage(
                                              'Assets/Icons/021-sun-2.png',
                                            ),
                                            width: 15.0,
                                            height: 15.0,
                                          ),
                                          SizedBox(width: 5.0,),
                                          Text(
                                            'Uv index'.toUpperCase(),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5.0,),
                                      Text(
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
                                  decoration: BoxDecoration(
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
                                          Image(
                                            image: AssetImage(
                                              'Assets/Icons/wind.png',
                                            ),
                                            width: 15.0,
                                            height: 15.0,
                                          ),
                                          SizedBox(width: 5.0,),
                                          Text(
                                            'Wind'.toUpperCase(),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5.0,),
                                      Text(
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
                                  decoration: BoxDecoration(
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
                                          Image(
                                            image: AssetImage(
                                              'Assets/Icons/drop.png',
                                            ),
                                            width: 15.0,
                                            height: 15.0,
                                          ),
                                          SizedBox(width: 5.0,),
                                          Text(
                                            'Humidity'.toUpperCase(),
                                            style: TextStyle(
                                               color: Colors.white,

                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5.0,),
                                      Text(
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

            // Temperature of each hour
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all( 10.0),
                child: Container(
                  decoration: BoxDecoration(
                        color: Color(0xff218bfd),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child:ListView.separated(
                    shrinkWrap: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: details.length,
                    itemBuilder:(context,index)=> buildDetailsModel(details[index]),
                    separatorBuilder: (context,index)=>SizedBox(width: 10,),
                  ),


                ),
              ),
            ),
          ],
        )
    );

  }
  Widget buildDetailsModel(DetailsModel details)=>Padding(
    padding: const EdgeInsets.all(10.0),
    child: Center(
      child: Column(
        children: [
          Expanded(
            child: Text(
              '${details.hour}',
              style: TextStyle(
                color:  Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Image(
              image: AssetImage('${details.imageUrl}',),
              width: 60.0,
              height: 60.0,
            ),
          ),
          SizedBox(height: 10.0,),
          Expanded(
              child: Text(
                '${details.temperature}°',
                style: TextStyle(
                 color:  Colors.white,
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
