import 'dart:async';

import 'package:flutter/material.dart';

// void showSnackBar(String title) {

//   final snackBar = SnackBar(
//     backgroundColor: kDeepBlue,
//     content: Text(
//       title,
//       textAlign: TextAlign.center,
//       style: const TextStyle(fontSize: 15),
//     ),
//   );
//   globalScaffoldKey.currentState!.showSnackBar(snackBar);
// }
showSnackBar(String title, BuildContext context,
    {bool popPage = false,
    duration = 3,
    Color color = Colors.white,
    EdgeInsetsGeometry? margin}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      margin: margin,
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      content: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
      duration: Duration(seconds: duration),
    ),
  );
  if (popPage) Timer(const Duration(seconds: 5), () => Navigator.pop(context));
}
