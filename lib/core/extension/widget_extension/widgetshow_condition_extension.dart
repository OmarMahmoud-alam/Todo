import 'package:flutter/material.dart';

extension WidgetshowConditionExtension on Widget {
  Widget? showIf(bool condition) {
    if (condition) {
      return this;
    }
    return null;
  }
}
