import 'package:e_commerce/core/constant/app_colors.dart';
import 'package:e_commerce/core/constant/app_routes.dart';
import 'package:e_commerce/core/constant/locale_keys.dart';
import 'package:e_commerce/core/constant/lottie_assets.dart';
import 'package:e_commerce/core/localization/app_translations.dart';
import 'package:e_commerce/core/localization/localization_controller.dart';
import 'package:e_commerce/core/services/network/network_controller.dart';
import 'package:e_commerce/core/routes/app_pages.dart';
import 'package:e_commerce/core/functions/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      final assets = [
        AppLottieAssets.loading,
        AppLottieAssets.serverFailure,
        AppLottieAssets.offlineFailure,
        AppLottieAssets.generalFailure,
      ];

      for (final path in assets) {
        // fire & forget
        AssetLottie(path).load();
      }
    });

    LocalizationController localizationController = Get.put(
      LocalizationController(),
    );

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          locale: localizationController.language,
          translations: AppTranslation(),
          debugShowCheckedModeBanner: false,
          theme: getThemeForLocale(localizationController.language).copyWith(
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: AppColors.primaryBlue,
              selectionColor: AppColors.primaryBlue.withOpacity(0.3),
              selectionHandleColor: AppColors.primaryBlue,
            ),
          ),
          initialRoute: AppRoutes.initial,
          getPages: AppPages.routes,

          builder: (context, child) {
            return Stack(
              children: [
                child!,
                GetX<NetworkController>(
                  builder: (controller) {
                    return !controller.isOnline.value
                        ? Positioned(
                            bottom: 20,
                            left: 20,
                            right: 20,
                            child: SafeArea(
                              child: Material(
                                elevation: 4,
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.redAccent,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    mainAxisSize:
                                        MainAxisSize.min, // wrap content
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.warning, color: Colors.white),
                                      SizedBox(width: 8),
                                      Text(
                                        LocaleKeys.noInternetConnection.tr,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
