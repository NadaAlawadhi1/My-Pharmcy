import 'package:flutter/material.dart';

ThemeData getThemeForLocale(Locale? locale) {
  final isArabic = locale?.languageCode == 'ar';
  return ThemeData(
    fontFamily: isArabic ? 'Tajawal' : 'Poppins',
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
  );
}

// ThemeData getThemeForLocale(Locale? locale) {
//   final isArabic = locale?.languageCode == 'ar';
//   final font = isArabic ? 'Tajawal' : 'Poppins';

//   final base = ThemeData(useMaterial3: true,    fontFamily: font,
// );

//   return base.copyWith(
//     textTheme: base.textTheme.apply(fontFamily: font),
//     primaryTextTheme: base.primaryTextTheme.apply(fontFamily: font),
//     scaffoldBackgroundColor: Colors.white,
//   );
// }
