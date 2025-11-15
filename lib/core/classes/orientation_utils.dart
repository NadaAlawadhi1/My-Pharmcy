import 'package:flutter/material.dart';

class OrientationUtils {
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }
}
