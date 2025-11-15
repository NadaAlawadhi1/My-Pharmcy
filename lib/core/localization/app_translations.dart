import 'package:get/get.dart';
import 'package:e_commerce/core/localization/en.dart';
import 'package:e_commerce/core/localization/ar.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en': en, 'ar': ar};
}
