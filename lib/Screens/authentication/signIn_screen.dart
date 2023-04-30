import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice/Screens/home_screen.dart';
import '../../Core/DataProvider/Remote/firebaseHelper.dart';
import '../../shared/constants/Constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  Future<void> signInParameter() async {
    if (_key.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0XFF0093E9),
                strokeWidth: 6,
              ),
            );
          });
      FireBaseHelper()
          .signIn(emailController.text.toString(),
              passwordController.text.toString())
          .then((value) {
        if (value is User) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "Hello ${value.displayName}",
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ));
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
              action: SnackBarAction(
                label: 'Dismiss',
                disabledTextColor: Colors.white,
                textColor: const Color(0xFFAB72C0),
                onPressed: () {
                  Navigator.pop(context);
                },
              )));
          Navigator.pop(context);
        }
      });
    }
  }
}
