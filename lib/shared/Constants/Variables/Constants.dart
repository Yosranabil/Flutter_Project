import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../Core/DataProvider/weatherData.dart';

var usernameController = TextEditingController();
var passwordController = TextEditingController();
var emailController = TextEditingController();

RegExp nameExp = RegExp(r'^[A-Za-z][A-Za-z0-9_]{7,29}$');
RegExp passExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$@!%&*?])[A-Za-z\d#$@!%&*?]{8,30}$');
RegExp emailExp = RegExp(r'\S+@\S+\.\S+');


Map<String, String> WeatherIcons =  {
  'Clear': 'Assets/Icons/sun.png',
  'Overcast': 'Assets/Icons/cloud-computing.png',
  'Cloudy': 'Assets/Icons/cloudsssss.png',
  'Sunny': 'Assets/Icons/sun.png',
  'Windy': 'Assets/Icons/winddd.png',
  'Thunderstorm': 'Assets/Icons/thunder.png',
  'Mist': 'Assets/Icons/cloudy (2).png',
  'Patchy rain possible': 'Assets/Icons/light-rain.png',
  'Light rain shower': 'Assets/Icons/light-rain.png',
  'Partly cloudy': 'Assets/Icons/cloudy.png',
  'Partly windy': 'Assets/Icons/winddd.png',
  'Partly sunny': 'Assets/Icons/cloudy.png',
  'Moderate rain': 'Assets/Icons/rain.png',
  'Light rain': 'Assets/Icons/light-rain.png',
  'Light drizzle': 'Assets/Icons/cloudsssss.png',
  'Snowy': 'Assets/Icons/snow.png',
};
/*Map<String, String> weatherIcons = {
  'Clear': 'Assets/Icons/021-sun-2.png',
  'Overcast': 'Assets/Icons/cloud.png',
  'Cloudy': 'Assets/Icons/clouds.png',
  'Sunny': 'Assets/Icons/021-sun-2.png',
  'Windy': 'Assets/Icons/windddyyy.png',
  'Thunderstorm': 'Assets/Icons/thunder (1).png',
  'Mist': 'Assets/Icons/cloudy (3).png',
  'Patchy rain possible': 'Assets/Icons/028-rainy.png',
  'Light rain shower': 'Assets/Icons/018-raining.png',
  'Partly cloudy': 'Assets/Icons/rain.png',
  'Partly windy': 'Assets/Icons/winddd.png',
  'Partly sunny': 'Assets/Icons/clear-sky.png',
  'Moderate rain': 'Assets/Icons/018-raining.png',
  'Light rain': 'Assets/Icons/rain (1).png',
  'Light drizzle': 'Assets/Icons/clouds.png',
  'Snowy': 'Assets/Icons/snow (1).png',
};*/
// API for day

