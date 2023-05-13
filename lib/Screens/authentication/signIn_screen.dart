import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:practice/Core/Services/sharedPreferences.dart';
import 'package:practice/Screens/authentication/signUp_screen.dart';
import 'package:practice/Screens/location_screen.dart';
import '../../Core/DataProvider/Remote/firebaseHelper.dart';
import '../../shared/Components/buttonWidget.dart';
import '../../shared/Components/passtextformfeildWidget.dart';
import '../../shared/Components/textformfieldWidget.dart';
import '../../shared/constants/Variables/Constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _key = GlobalKey<FormState>();
  bool visible = true;
  final PrefService _prefService = PrefService();

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
            "Sign In",
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
                height: 420,
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
                          "Welcome Back",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonWidget(
                            width: 220,
                            height: 50,
                            radius: 15,
                            onClick: signInWithGoogle,
                            child: Row(
                              children: const [
                                CircleAvatar(
                                  backgroundImage: AssetImage('Assets/Icons/google.png'),
                                  radius: 15,
                                  backgroundColor: Colors.transparent,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Sign in with Google',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Or',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            endIndent: 50,
                            indent: 50,
                            color: Colors.deepPurple[200],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Form(
                          key: _key,
                          child: Column(
                            children: [
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
                              const SizedBox(height: 20,),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  ButtonWidget(
                                    width: 65,
                                    height: 45,
                                    radius: 15,
                                    onClick: signInParameter,
                                    child: const Icon(
                                      Icons.arrow_right_alt_rounded,
                                      color: Colors.white,
                                      size: 45,
                                      weight: 4,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 50,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Don't have an account?",
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
                                            builder: (context) => const SignUpScreen(),
                                          ));
                                    },
                                    child: const Text(
                                      'Sign up',
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
                builder: (context) => MyLocation(),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen(),));
                },
              )));
          Navigator.pop(context);
        }
      });
    }
  }

  void signInWithGoogle() async {

    try{
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      print("in the signin page: ${userCredential.user?.displayName}");

      if (googleUser != null)
      {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => MyLocation(),));
      }
      else
      {
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignUpScreen()),
        );
      }
    }
    catch(e){
      print('the error is: $e');
    }

  }
}
