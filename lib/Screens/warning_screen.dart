import 'package:flutter/material.dart';
import '../shared/Components/buttonWidget.dart';
import 'location_screen.dart';

class WarningScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Warning:',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            'Please check the spelling of the previous location\nor check your internet connection\nand try again',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          ButtonWidget(
            height: 50,
            width: 70,
            radius: 20,
            child: const Text(
              'OK',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            onClick: ()
            {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>MyLocation(),));
            },
          ),
        ],
      ),
    );
  }
}
