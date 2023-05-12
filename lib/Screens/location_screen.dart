import 'package:flutter/material.dart';
import 'package:practice/Shared/Components/BottomNavBar.dart';
import 'package:practice/shared/Components/buttonWidget.dart';

class MyLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RegExp locExp = RegExp(r'^[A-Za-z]{3,26}$');
    var locController = TextEditingController();
    final k = GlobalKey<FormState>();

    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("Assets/Images/4893007a48c9d8642ec855e0896780aa.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Welcome to Forcastly",
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Material(
              elevation: 5,
              borderRadius: BorderRadiusDirectional.circular(30),
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(30),
                  color: Colors.white.withOpacity(0.5),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Text(
                          "Please Enter A Location",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.deepPurple.withOpacity(0.5),
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: k,
                          child: TextFormField(
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.deepPurple,
                            ),
                            validator: (value) {
                              if (value!.isEmpty || !locExp.hasMatch(locController.text.toString())) {
                                return 'A valid location should be at least three letters';
                              } else {
                                return null;
                              }
                            },
                            controller: locController,
                            decoration: InputDecoration(
                              labelText: 'Location',
                              border: InputBorder.none,
                              prefixIcon: const Icon(
                                Icons.location_on_rounded,
                                color: Colors.deepPurple,
                              ),
                              labelStyle: const TextStyle(
                                fontSize: 22,
                                color: Colors.deepPurple,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.deepPurple.withOpacity(0.5)
                                ),
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.deepPurple.withOpacity(0.5)
                                ),
                                  borderRadius: BorderRadius.circular(40.0),
                              ),
                            ),
                          ),
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
                          if(k.currentState!.validate())
                            {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar(location: locController.text.toString()),));
                            }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
