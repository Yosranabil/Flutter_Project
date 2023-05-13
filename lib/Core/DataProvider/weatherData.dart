import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Model/weather_model.dart';
import '../../Model/dailyForecast.dart';

class WeatherData {

  Future<weather> getData(var location) async {
    var uricall = Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=e8969a727ad44f2fad0205208232604&q=$location&days=7&aqi=no&alerts=no');
    var response = await http.get(uricall);
    var body = jsonDecode(response.body);
    return weather.fromJson(body);
  }
  // Future<List<String>> location(String query) async {
  //   var url = Uri.parse("https://wft-geo-db.p.rapidapi.com/v1/geo/cities?namePrefix=$query");
  //   var headers = {
  //     "X-RapidAPI-Key": "a6678e9f54msh9606fc7d3bdd044p15d211jsn9d4443bfd13d",
  //     "X-RapidAPI-Host": "wft-geo-db.p.rapidapi.com"
  //   };
  //
  //   var response = await http.get(url, headers: headers);
  //   if (response.statusCode == 200) {
  //     var jsonData = jsonDecode(response.body);
  //     List<String> parsedSuggestions = List<String>.from(jsonData['data'].map((result) => result['name']));
  //     print(parsedSuggestions[0]);
  //     return parsedSuggestions;
  //   }
  //   return [];
  // }
  Future<List<String>> location(String query) async {
    var url = Uri.parse("https://wft-geo-db.p.rapidapi.com/v1/geo/cities?namePrefix=$query");
    var headers = {
      "X-RapidAPI-Key": "a6678e9f54msh9606fc7d3bdd044p15d211jsn9d4443bfd13d",
      "X-RapidAPI-Host": "wft-geo-db.p.rapidapi.com"
    };

    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      if (jsonData.containsKey('data')) {
        List<String> parsedSuggestions =
        List<String>.from(jsonData['data'].map((result) => result['name']));
        return parsedSuggestions;
      } else {
        // Location not found in API response
        return [];
      }
    }
    // Error occurred or API request failed
    return [];
  }


  Future<List<DailyForecast>> getDataDaily(var location) async {
    var uri = Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=9cbcc04a13644107852121623231005&q=$location&days=10&aqi=no&alerts=no');
    var response = await http.get(uri);
    var body = jsonDecode(response.body);

    List<DailyForecast> forecasts = [];
    var forecastDays = body['forecast']['forecastday'];
    for (var forecastDay in forecastDays) {
      forecasts.add(DailyForecast.fromJson(forecastDay));
    }
    return forecasts;
  }

}