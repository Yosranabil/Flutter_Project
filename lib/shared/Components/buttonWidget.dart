import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({super.key, required this.onClick, required this.width, required this.radius, required this.child, required this.height});

  VoidCallback onClick;
  double width, radius, height;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),//15
          gradient: const LinearGradient(
            colors: [
              Color(0XFF0093E9),
              Color(0XFFB721FF),
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft ,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child,
          ],
        ),
      ),
    );
  }
}
