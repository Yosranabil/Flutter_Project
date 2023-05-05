import 'package:flutter/material.dart';

class Weather {
  int id;
  String main, description, icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: int.parse(json["id"]),
      main: json["main"],
      description: json["description"],
      icon: json["icon"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "main": this.main,
      "description": this.description,
      "icon": this.icon,
    };
  }

//
}