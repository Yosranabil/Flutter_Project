import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback press;

  const ProfileItem(
      {super.key, required this.text, required this.icon, required this.press});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 20,
      ),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadiusDirectional.circular(20),
        child: InkWell(
          onTap: press,
          child: Container(
            height: 55,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(20),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    icon,
                    size: 30,
                    color: const Color(0XFF0093E9),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 25,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
