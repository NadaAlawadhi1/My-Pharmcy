import 'package:e_commerce/core/services/app_services.dart';
import 'package:e_commerce/core/services/network/network_controller.dart';
import 'package:e_commerce/features/authentication/presentation/controllers/google_auth_controller.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppInitializer {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initServices();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    Get.put(NetworkController());

    Get.put(GoogleAuthController());

  }
}
