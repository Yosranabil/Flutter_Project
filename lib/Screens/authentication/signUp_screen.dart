import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice/Screens/home_screen.dart';
import '../../Core/DataProvider/Remote/firebaseHelper.dart';
import '../../shared/constants/Constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }

  Future<void> signUpParameter() async {
    if (_key.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFFAB72C0),
                strokeWidth: 7,
              ),
            );
          });
      FireBaseHelper()
          .signUp(
              emailController.text.toString(),
              passwordController.text.toString(),
              usernameController.text.toString())
          .then((value) {
        if (value is User) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
        } else if (value is String) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              value,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            behavior: SnackBarBehavior.floating,
          ));
          Navigator.pop(context);
        }
      });
    }
  }
}
