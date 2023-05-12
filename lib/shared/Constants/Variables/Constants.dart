import 'package:flutter/material.dart';


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

