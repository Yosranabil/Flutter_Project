import 'package:flutter/material.dart';
import 'package:practice/Shared/Components/BottomNavBar.dart';
import '../shared/Constants/Variables/Constants.dart';

class MyLocation extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    var TextController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: TextController,
                validator: (value) {
                  if (value!.isEmpty ) {
                    return "please enter a location";
                  } else {
                    return null;
                  }
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar(location: TextController.text.toString()),));
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
