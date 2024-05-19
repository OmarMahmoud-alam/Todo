import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Completeinput extends StatelessWidget {
  const Completeinput({
    super.key,
    required this.child,
    required this.name,
    this.isrequired = true,
  });
  final Widget child;
  final String name;
  final bool isrequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
           Gap(5),
            (isrequired)
                ? const Opacity(
                    opacity: 0.80,
                    child: Text(
                      '*',
                      style: TextStyle(
                        color: Color(0xFFDA1414),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        height: 0.12,
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
Gap(8),
        child
      ],
    );
  }
}
