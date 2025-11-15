import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackType { success, error, warning, info }

void showSnack(
  String title,
  String message, {
  SnackType type = SnackType.info,
}) {
  IconData icon;

  switch (type) {
    case SnackType.success:
      icon = Icons.check_circle_outline;
      break;
    case SnackType.error:
      icon = Icons.error_outline;
      break;
    case SnackType.warning:
      icon = Icons.warning_amber_outlined;
      break;
    case SnackType.info:
    default:
      icon = Icons.info_outline;
      break;
  }

  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.TOP,
    margin: const EdgeInsets.all(12),
    borderRadius: 10,
    icon: Icon(icon, ),
    duration: const Duration(seconds: 3),
  );
}
