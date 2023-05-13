import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:practice/Model/search_model.dart';
import 'package:practice/Screens/details_screen.dart';
import '../Core/DataProvider/weatherData.dart';


class MySearchDelegate extends SearchDelegate{

  var client =WeatherData();
  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context).copyWith(
      appBarTheme: super.appBarTheme(context).appBarTheme.copyWith(
        elevation: 0.0,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
      icon: const Icon(Icons.clear),
      onPressed: (){
        if(query.isEmpty){
          close(context, null);
        } else {
          query = '';
          close(context, null);
        }
      }
    )
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    onPressed: ()=> close(context,null),//close searchbar
    icon: const Icon(
        Icons.arrow_back,
      ),
  );

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      query = query.replaceAll(' ', '');
      // Perform a check for valid location before navigating to the DetailsScreen
      return FutureBuilder<List<dynamic>>(
        future: Future.wait([
          client.location(query),
          client.getData(query),
          client.getDataDaily(query),
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Colors.deepPurple));
          } else {
            List locations = snapshot.data ?? [];
            if (locations.isEmpty) {
              // No valid locations found, inform the user
              return Center(child: Text('No Weather found for $query'));
            } else {
              // Valid locations found, navigate to the DetailsScreen
              return DetailsScreen(locationController: query);
            }
          }
        },
      );
    }else{
      // User didn't enter any query, handle accordingly
      return Center(child: Text('Please Enter City To Search Weather'));
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<String>?>(
      future: client.location(query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data![index]),
                onTap: () {
                  query=snapshot.data![index];
                  showResults(context);
                },
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator(color: Colors.deepPurple,));
        }
      }
    );
  }



  // Widget buildSearchModel(SearchModel search)=>Padding(
  //     padding: const EdgeInsets.all(10.0),
  //     child: Container(
  //       height: 150,
  //       decoration: BoxDecoration(
  //           gradient: LinearGradient(
  //             colors: search.colors,
  //           ),
  //           borderRadius: BorderRadius.circular(30.0)
  //       ),
  //       child: Row(
  //         children: [
  //           Expanded(
  //             child: Padding(
  //               padding: const EdgeInsets.only(left: 25.0),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Text(
  //                     '${search.location}',
  //                     style: TextStyle(
  //                       fontSize: 25,
  //                       fontWeight: FontWeight.bold,
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                   SizedBox(height: 10,),
  //                   Text(
  //                     '${search.weatherStatus}',
  //                     style: TextStyle(
  //                       fontSize: 15,
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                   SizedBox(height: 10,),
  //
  //                   Text(
  //                     "${search.temperature}°",
  //                     style: TextStyle(
  //                       fontSize: 25,
  //                       fontWeight: FontWeight.bold,
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           Expanded(
  //             child: Image(
  //               image: AssetImage(
  //                 '${search.imageUrl}',
  //               ),
  //               width: 150,
  //               height: 140,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
}

