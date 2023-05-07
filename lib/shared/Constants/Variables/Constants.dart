import 'package:flutter/material.dart';

var usernameController = TextEditingController();
var passwordController = TextEditingController();
var emailController = TextEditingController();
var TextController = TextEditingController();

RegExp nameExp = new RegExp(r'^[A-Za-z][A-Za-z0-9_]{7,29}$');
RegExp passExp = new RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$@!%&*?])[A-Za-z\d#$@!%&*?]{8,30}$');
RegExp emailExp = RegExp(r'\S+@\S+\.\S+');
