import 'package:e_commerce/core/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationController extends GetxController {
  Locale? language;
  final AppServices appServices = Get.find<AppServices>();

  @override
  void onInit() {
    // Check if language is saved in shared preferences
    String? savedLang = appServices.sharedPreferences.getString('lang');

    if (savedLang == 'ar') {
      language = const Locale('ar');
    } else if (savedLang == 'en') {
      language = const Locale('en');
    } else {
      // fallback to device locale if nothing saved
      language = Get.deviceLocale ?? const Locale('ar');
    }

    super.onInit();
  }

  void changeLanguage(String languageCode) {
    Locale locale = Locale(languageCode);
    language = locale;

    appServices.sharedPreferences.setString('lang', languageCode);
    Get.updateLocale(locale);
    update();
  }
}
