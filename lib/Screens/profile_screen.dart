import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice/Screens/authentication/signUp_screen.dart';
import '../Core/DataProvider/Remote/firebaseHelper.dart';
import '../Shared/Components/BottomNavBar.dart';
import '../Shared/Components/BuildProfileMenu.dart';

class ProfileScreen extends StatefulWidget {
   ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
            "Profile",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w400,
        )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded,),
            iconSize: 30,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
              children: [
                Material(
                  elevation: 3,
                  borderRadius: BorderRadiusDirectional.circular(30),
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: double.infinity,
                    height: 280,
                    decoration: const BoxDecoration(
                      color: Color(0XFF0093E9),
                      borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(30),
                        bottomStart: Radius.circular(30),
                      ),
                    ),
                    child: const Image(
                      image: AssetImage("Assets/Images/4893007a48c9d8642ec855e0896780aa2.jpg",),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 30,
                  bottom: -35,
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadiusDirectional.circular(57),
                    child: SizedBox(
                      height: 115,
                      width: 115,
                      child: Stack(
                        fit: StackFit.expand,
                        clipBehavior: Clip.none,
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage("Assets/Icons/boy.png"),
                          ),
                          Positioned(
                            right: -5,
                            bottom: 0,
                            child: Material(
                              elevation: 3,
                              borderRadius: BorderRadiusDirectional.circular(27),
                              child: CircleAvatar(
                                radius: 23,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius:20,
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.camera_alt_outlined,),
                                    color: const Color(0XFF0093E9),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              left: 20,
              bottom: 5,
            ),
            child: Row(
              children: [
                InkWell(
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadiusDirectional.circular(20),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                        child:Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                          children:  [
                            ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (Rect bounds) => const RadialGradient(
                                center: Alignment.topCenter,
                                stops: [1,1],
                                colors: [
                                  Color(0XFFB721FF),
                                  Color(0XFF0093E9),
                                ],
                              ).createShader(bounds),
                              child: const Icon(
                                Icons.person,
                                size: 45,
                              ),
                            ),
                            const SizedBox(height: 5,),
                            const Text(
                              "Jon Holmes",
                              style: TextStyle(
                                color: Color(0XFF0093E9),
                                fontSize: 14.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                      ),
                        ),
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                InkWell(
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadiusDirectional.circular(20),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (Rect bounds) => const RadialGradient(
                                center: Alignment.topCenter,
                                stops: [1,1],
                                colors: [
                                  Color(0XFFB721FF),
                                  Color(0XFF0093E9),
                                ],
                              ).createShader(bounds),
                              child: const Icon(
                                Icons.email_rounded,
                                size: 40,
                              ),
                            ),
                            const SizedBox(height: 10,),
                            const Text(
                              "@JHolmes",
                              style: TextStyle(
                                color: Color(0XFF0093E9),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ProfileItem(
            icon: Icons.tune,
            text: "Settings",
            press: () {},
          ),
          ProfileItem(
            icon: Icons.translate_rounded,
            text: "Language",
            press: () {},
          ),
          ProfileItem(
            icon: Icons.logout_rounded,
            text: "Log out",
            press: () async{
              await FireBaseHelper().signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadiusDirectional.circular(20),
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(20),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.dark_mode_rounded,
                        size: 30,
                        color: Color(0XFF0093E9),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    const Expanded(
                      child: Text(
                        "Dark Theme",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeColor: const Color(0XFF0093E9),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
