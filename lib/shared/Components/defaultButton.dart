
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  double height = 50.0,
  Color? color = Colors.white,
  List<Color> colors = const [Color(0xff283EE8),Color(0xffB721FF)],
  bool isUpperCase=true,
  double radius=10.0,
  required void Function() onPressed,
  required String text,
})=> Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    gradient: LinearGradient(
      colors: (colors),
    ),
  ),
  child: MaterialButton(
    onPressed: onPressed,
    child:  Text(
      isUpperCase? text.toUpperCase():text,
      style: TextStyle(
        color: color,
        fontWeight:FontWeight.bold,
        fontSize: 20.0,
      ),
      textAlign: TextAlign.center,

    ),
  ),
);
