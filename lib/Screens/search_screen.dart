import 'package:flutter/material.dart';
import 'package:practice/Model/search_model.dart';

class MySearchDelegate extends SearchDelegate{


  List<SearchModel> search = [
    SearchModel(
      location: 'My Location',
      weatherStatus: 'Rainy',
      temperature: 21,
      imageUrl: 'Assets/Icons/weather-app.png',
      colors: [Color(0xff354f60), Color(0xff506e81)],
    ),
    SearchModel(
      location: 'Cairo',
      weatherStatus: 'Partly Cloudy',
      temperature: 17,
      imageUrl: 'Assets/Icons/cloudy.png',
      colors: [Color(0xff291559),Color(0xff593f9b),],
    ),
    SearchModel(
      location: 'Istanbul',
      weatherStatus: 'Sunny',
      temperature: 24,
      imageUrl: 'Assets/Icons/sunny.png',
      colors: [Color(0xfff1c226),Color(0xfffd7502),],
    ),
    SearchModel(
      location: 'London',
      weatherStatus: 'Snowy',
      temperature: -6,
      imageUrl: 'Assets/Icons/snowy.png',
      colors: [Color(0xff3878ee),Color(0xff218bfd),],
    ),
    SearchModel(
      location: 'Paris',
      weatherStatus: 'Stormy',
      temperature: -3,
      imageUrl: 'Assets/Icons/storm.png',
      colors: [Color(0xff2e5073),Color(0xff1b3045),],
    ),

  ];

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
          close(context,null);
        } else {
          query = '';
        }
      }
    )
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    onPressed: ()=> close(context,null),//close searchbar
    icon: Icon(
        Icons.arrow_back,
      ),
  );

  @override
  Widget buildResults(BuildContext context) => Center(
    child: Text(
      query,
      style: const TextStyle(
        fontSize: 64,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  @override
  Widget buildSuggestions(BuildContext context) {
    //List<String> locations = search.map((searchModel) => searchModel.location).where((location) => location != null).toList();
    //print(locations);
    List<SearchModel> suggestions = search.where((element){
      final result = element.location.toLowerCase();
      print(result);
      final input = query.toLowerCase();
      print(input);

      return result!.contains(input);
    }).toList();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context,index) {
          //final suggestion = suggestions[index];
          return buildSearchModel(suggestions[index]);
        }
          )
    );
  }


  Widget buildSearchModel(SearchModel search)=>Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      height: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: search.colors,
        ),
        borderRadius: BorderRadius.circular(30.0)
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${search.location}',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    '${search.weatherStatus}',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10,),

                  Text(
                    "${search.temperature}°",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Image(
              image: AssetImage(
                '${search.imageUrl}',
              ),
              width: 150,
              height: 140,
            ),
          ),
        ],
      ),
    ),
  );
}
