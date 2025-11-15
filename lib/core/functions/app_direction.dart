import 'package:flutter/material.dart';

bool isAppDirectionRTL(BuildContext context) =>
    Directionality.of(context) == TextDirection.rtl;
