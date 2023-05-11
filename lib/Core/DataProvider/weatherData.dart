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