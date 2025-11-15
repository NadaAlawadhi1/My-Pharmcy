import 'package:e_commerce/core/constant/image_asset.dart';
import 'package:e_commerce/core/constant/locale_keys.dart';
import 'package:e_commerce/features/onboarding/data/model/onboarding_model.dart';

List<OnboardingModel> onboardingList = [
  OnboardingModel(
    title: LocaleKeys.onboardingTitle1,
    image: AppImageAssets.onboardingImageOne,
    body: LocaleKeys.onboardingBody1,
  ),
  OnboardingModel(
    title: LocaleKeys.onboardingTitle2,
    image: AppImageAssets.onboardingImageTwo,
    body: LocaleKeys.onboardingBody2,
  ),
  OnboardingModel(
    title: LocaleKeys.onboardingTitle3,
    image: AppImageAssets.onboardingImageThree,
    body: LocaleKeys.onboardingBody3,
  ),
  OnboardingModel(
    title: LocaleKeys.onboardingTitle4,
    image: AppImageAssets.onboardingImageFour,
    body: LocaleKeys.onboardingBody4,
  ),
];
