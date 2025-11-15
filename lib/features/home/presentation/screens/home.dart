import 'package:e_commerce/core/constant/app_colors.dart';
import 'package:e_commerce/core/constant/app_routes.dart';
import 'package:e_commerce/core/constant/locale_keys.dart';
import 'package:e_commerce/core/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final appServices = Get.find<AppServices>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
  backgroundColor: AppColors.backgroundLight,
  title: Text(LocaleKeys.home.tr),
  actions: [
    IconButton(
      icon: const Icon(Icons.logout),
      tooltip: LocaleKeys.logout.tr,
      onPressed: () async {
        appServices.logout();
        Get.offAllNamed(AppRoutes.signIn);
      },
    ),
  ],
),
body: Center(
  child: Padding(
    padding: const EdgeInsets.all(24.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          FontAwesomeIcons.staffSnake,
          color: AppColors.primaryBlue,
          size: 80,
        ),
        const SizedBox(height: 20),
        Text(
          LocaleKeys.welcomeBack.tr,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          LocaleKeys.loggedInSuccess.tr,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black54),
        ),
      ],
    ),
  ),
),
    );
  }
}
