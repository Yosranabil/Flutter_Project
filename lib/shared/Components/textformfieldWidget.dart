import 'package:flutter/material.dart';

class formfieldWidget extends StatelessWidget {
  formfieldWidget(
      {required this.textController,
      required this.textExp,
      required this.errortext,
      required this.labeltext,
      required this.texttype,
      required this.icon});

  var textController = TextEditingController();
  RegExp textExp;
  String labeltext;
  String errortext;
  TextInputType texttype;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      keyboardType: texttype,
      validator: (value) {
        if (value!.isEmpty ||
            !textExp.hasMatch(textController.text.toString())) {
          return errortext;
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        icon: Icon(
          icon,
          color: Colors.deepPurple,
        ),
        labelText: labeltext,
        labelStyle: const TextStyle(
          fontSize: 22,
          color: Colors.deepPurple,
        ),
        border: InputBorder.none,
      ),
    );
  }
}
