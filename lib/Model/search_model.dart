import 'package:flutter/material.dart';

class SearchModel{
  final String location;
  final String weatherStatus;
  final int temperature;
  final String imageUrl;
  final List<Color> colors;

  SearchModel({
    required this.location,
    required this.weatherStatus,
    required this.temperature,
    required this.imageUrl,
    required this.colors,
  });


}