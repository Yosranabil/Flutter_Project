import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({super.key, required this.onClick});

  VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: 65,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          gradient: LinearGradient(
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
          children: const [
            Icon(
              Icons.arrow_right_alt_rounded,
              color: Colors.white,
              size: 45,
              weight: 4,
            ),
          ],
        ),
      ),
    );
  }
}
