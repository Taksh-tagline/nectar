import 'package:flutter/material.dart';

void nextScreen({required BuildContext context, required Widget nextScreen}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => nextScreen));
}

void nextScreenReplace(
    {required BuildContext context, required Widget nextScreen}) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => nextScreen));
}
