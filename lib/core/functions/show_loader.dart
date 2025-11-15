import 'package:e_commerce/core/constant/lottie_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget buildLoader({double size = 80}) {
  return Center(
    child: Lottie.asset(AppLottieAssets.loading, width: size, height: size),
  );
}
