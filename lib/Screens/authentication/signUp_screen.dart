import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice/Screens/authentication/signIn_screen.dart';
import 'package:practice/Screens/home_screen.dart';
import 'package:practice/Shared/Components/BottomNavBar.dart';
import '../../Core/DataProvider/Remote/firebaseHelper.dart';
import '../../shared/Components/buttonWidget.dart';
import '../../shared/Components/passtextformfeildWidget.dart';
import '../../shared/Components/textformfieldWidget.dart';
import '../../shared/constants/Constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _key = GlobalKey<FormState>();
  bool visible = true;

  @override
  Widget build(BuildContext context) {
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
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
              "Sign Up",
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
                height: 510,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(30),
                  color: Colors.white.withOpacity(0.5),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                        key: _key,
                        child: Column(
                          children: [
                            formfieldWidget(
                              textController: usernameController,
                              texttype: TextInputType.name,
                              errortext:
                              'A valid username should be between 8-30 letters, must start\nwith  an alphabetic character, and not contain any character',
                              labeltext: 'Username',
                              textExp: nameExp,
                              icon: Icons.person,
                            ),
                            formfieldWidget(
                              textController: emailController,
                              texttype: TextInputType.emailAddress,
                              errortext:
                              'A valid email should be not empty and in form of (@ .com).',
                              labeltext: 'Email',
                              textExp: emailExp,
                              icon: Icons.alternate_email_rounded,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            passformfieldWidget(
                              textExp: passExp,
                              visible: visible,
                              textController: passwordController,
                              icon: Icons.password,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                ButtonWidget(
                                  onClick: signUpParameter,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 45,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const SignInScreen(),
                                        ));
                                  },
                                  child: const Text(
                                    'Sign in',
                                    style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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

  Future<void> signUpParameter() async {
    if (_key.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0XFF0093E9),
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
                builder: (context) => const BottomNavBar(),
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
