import 'package:flutter/material.dart';

class passformfieldWidget extends StatefulWidget {
  passformfieldWidget(
      {required this.textController,
        required this.visible,
        required this.textExp,
        required this.icon,
      });

  var textController = TextEditingController();
  bool visible;
  RegExp textExp;
  IconData icon;

  @override
  State<passformfieldWidget> createState() => _passformfieldWidgetState(v: visible, i: icon);
}

class _passformfieldWidgetState extends State<passformfieldWidget> {

  _passformfieldWidgetState({required this.v, required this.i});
  bool v;
  IconData i;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      validator: (value) {
        if (value!.isEmpty ||
            !widget.textExp.hasMatch(
                widget.textController.text.toString())) {
          return 'A valid password should be between 8-30 characters must\n contain at least one lowercase, at least one uppercase, \n at least one number and at least one special character.';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.visiblePassword,
      obscureText: v,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              v = !v;
            });
          },
          icon:  Icon(v? Icons.visibility :Icons.visibility_off,color: Colors.deepPurple,),
        ),
        labelText: 'Password',
        labelStyle: const TextStyle(
          fontSize: 22,
          color: Colors.deepPurple,
        ),
        icon: Icon(
          i,
          color: Colors.deepPurple,
        ),
        border: InputBorder.none,
      ),
    );
  }


}
