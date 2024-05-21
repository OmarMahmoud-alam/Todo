import 'package:flutter/material.dart';

class PopupRowitem extends StatelessWidget {
  const PopupRowitem({
    super.key,
    required this.title,
    this.onTap,
  });
  final title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      //focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: SizedBox(
            width: 140,
            child: Row(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    height: 0.12,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
