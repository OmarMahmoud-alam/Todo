import 'package:flutter/material.dart';
import 'package:todoapp/core/utils/assest_fonts_constant/const_color.dart';

Widget customTextField({
  Icon? endIcon,
  Widget? prefix,
  String? hintText,
  int maxLines = 1,
  int minLines = 1,
  Color? color,
  bool readOnly = false,
  required bool isPassword,
  required TextInputType type,
  required TextEditingController controller,
  void Function()? ontap,
  String? Function(String?)? validate,
  VoidCallback? onPressed,
}) {
  return TextFormField(
      onTap: ontap,
      readOnly: readOnly,
      maxLines: maxLines,
      minLines: minLines,
      validator: validate,
      controller: controller,
      style: TextStyle(color: Colors.black.withOpacity(.8)),
      obscureText: isPassword,
      keyboardType: type,
      cursorColor: kDeepBlue,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        filled: true,
        fillColor: color ?? Colors.white,
        prefixIconColor: kDeepBlue,
        prefixIcon: prefix,
        hintStyle: const TextStyle(
          color: Color(0xFF9F9F9F),
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 0.11,
        ),
        suffixIcon: endIcon != null
            ? IconButton(
                color: const Color(0xFFE1E1E1),
                splashRadius: 1,
                onPressed: onPressed,
                icon: endIcon,
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 1,
            color: (kDeepBlue),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xFFE1E1E1),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xFFE1E1E1),
          ),
        ),
        hintMaxLines: 1,
        hintText: hintText,
      ));
}
