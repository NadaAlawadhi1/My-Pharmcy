import 'dart:async';
import 'package:e_commerce/core/constant/locale_keys.dart';
import 'package:e_commerce/core/functions/show_snackbar.dart';
import 'package:e_commerce/core/services/app_services.dart';
import 'package:e_commerce/core/services/network/request_status.dart';
import 'package:e_commerce/features/authentication/data/model/user_model.dart';
import 'package:e_commerce/features/authentication/data/repositories_impl/google_auth_repository.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthController extends GetxController {
  final AppServices services = Get.find<AppServices>();
  final GoogleAuthRepository repository = GoogleAuthRepository();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );

  var status = RequestStatus.success.obs;

  Future<void> signInWithGoogle() async {
    try {
      status.value = RequestStatus.loading;
      update();

      final GoogleSignInAccount? account = await _googleSignIn.signIn();

      if (account == null) {
        status.value = RequestStatus.failure;
        showSnack(LocaleKeys.error.tr, LocaleKeys.googleSignInCancelled.tr,
            type: SnackType.info);
        return;
      }

      final email = account.email;
      final name = account.displayName ?? "";
      final googleId = account.id;
      final photo = account.photoUrl ?? "";

      final res = await repository.loginWithGoogle(
        email: email,
        name: name,
        googleId: googleId,
        photo: photo,
      );

      res.fold((failure) {
        status.value = failure;
        showSnack(LocaleKeys.error.tr, LocaleKeys.somethingWentWrong.tr,
            type: SnackType.error);
      }, (UserModel user) async {
        await services.saveUserData(user);
        await services.setLoggedIn(true);

        status.value = RequestStatus.success;
        showSnack(LocaleKeys.success.tr, LocaleKeys.loggedInAs.trParams({'name': user.name}),
            type: SnackType.success);

        Get.offAllNamed("/home");
      });
    } catch (e) {
      status.value = RequestStatus.failure;
      showSnack(LocaleKeys.error.tr, "${LocaleKeys.googleSignInError.tr}: ${e.toString()}",
          type: SnackType.error);
    } finally {
      update();
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await services.logout();
    Get.offAllNamed("/sign_in");
  }
}
