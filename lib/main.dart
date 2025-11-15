import 'package:e_commerce/core/init/app_initializer.dart';
import 'package:e_commerce/features/app_root/presentation/app_root.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await AppInitializer.init();
  runApp(const AppRoot());
}
