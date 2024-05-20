import 'package:flutter/material.dart';
import 'package:todoapp/core/utils/assest_fonts_constant/app_fonts.dart';
import 'package:todoapp/core/utils/assest_fonts_constant/const_color.dart';



class CustomButton extends StatefulWidget {
  const CustomButton(
      {Key? key,
      required this.text,
      required this.textColor,
      this.borderRadius,
      this.fontSize,
      this.backgroundColor = kDeepBlue,
      this.onPressed,
      this.borderColor,
      this.height,
      this.width,
      this.textstyle})
      : super(key: key);
  final String text;
  final Color textColor;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final double? fontSize;
  final double? height;
  final double? width;
  final Color backgroundColor;
  final void Function()? onPressed;
  final TextStyle? textstyle;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 50,
      width: widget.width ?? 280,
      child: TextButton(
        onPressed: widget.onPressed,
        
        style: TextButton.styleFrom(
          backgroundColor: widget.backgroundColor,
          shape: RoundedRectangleBorder(
            side:
                BorderSide(color: widget.borderColor ?? widget.backgroundColor),
            borderRadius: widget.borderRadius ?? BorderRadius.circular(15),
          ),
        ),
        child: Text(widget.text,
            style: widget.textstyle ??
                FontStyles.textStyle11.copyWith(color: widget.textColor)),
      ),
    );
  }
}

Widget customAuthButton({
  required String text,
  required VoidCallback onTap,
  backgroundColor = kDeepBlue,
  textcolor = Colors.white,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: backgroundColor),
      child: Center(
        child: Text(text,
            style: FontStyles.textStylebold16.copyWith(color: textcolor)),
      ),
    ),
  );
}