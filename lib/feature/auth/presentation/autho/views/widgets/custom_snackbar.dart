import 'package:flutter/material.dart';
import 'package:todoapp/core/utils/assest_fonts_constant/const_color.dart';

showSnackBar(String title,
    {bool popPage = false,
    duration = 3,
    Color color = kDeepBlue,
    context,
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
          color: Colors.white,
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
}

showUppearSnackBar(String title, BuildContext context,
    {bool popPage = false,
    duration = 3,
    Color color = kDeepBlue,
    EdgeInsetsGeometry? margin}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.up,
      backgroundColor: color,
      // width: 300,
      /*  margin: EdgeInsets.only(
          bottom: MediaQuery.of(MagicRouter.currentContext!).size.height - 100),*/
      elevation: 0,
      //padding: EdgeInsets.zero,
      content: SizedBox(
        width: 100,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

showErrorSnackBar(BuildContext context, String title,
    {bool popPage = false,
    int duration = 3,
    Color color = Colors.redAccent,
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
          color: Colors.white,
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
}
