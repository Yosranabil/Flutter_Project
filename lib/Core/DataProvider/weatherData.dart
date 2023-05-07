import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Model/weather_model.dart';

class WeatherData{
  Future<weather> getData(var location) async {
    var uricall = Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=e8969a727ad44f2fad0205208232604&q=$location&days=1&aqi=no&alerts=no');
    var response = await http.get(uricall);
    var body = jsonDecode(response.body);
    return weather.fromJson(body);
  }
}