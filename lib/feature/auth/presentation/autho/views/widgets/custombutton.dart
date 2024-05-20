import 'package:flutter/material.dart';
import 'package:todoapp/core/utils/assest_fonts_constant/app_fonts.dart';
import 'package:todoapp/core/utils/assest_fonts_constant/const_color.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor = kDeepBlue,
    this.textcolor = kWhite,
  });
  final String text;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color textcolor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            color: backgroundColor),
        child: Center(
          child: Text(text,
              style: FontStyles.textStylebold16.copyWith(color: textcolor)),
        ),
      ),
    );
  }
}
