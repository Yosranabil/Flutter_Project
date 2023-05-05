import 'package:practice/Model/Clouds.dart';
import 'package:practice/Model/Coord.dart';
import 'MainClass.dart';
import 'Sys.dart';
import 'Weather.dart';

class CurrentWeatherData{
  Coord coord;
  List<Weather> weather;
  String base, name;
  MainClass mainweather;
  int visibiity, dt, timezone, id, cod;
  Clouds clouds;
  Sys sys;

  CurrentWeatherData({
    required this.coord,
    required this.weather,
    required this.base,
    required this.name,
    required this.mainweather,
    required this.visibiity,
    required this.dt,
    required this.timezone,
    required this.id,
    required this.cod,
    required this.clouds,
    required this.sys
  });
}