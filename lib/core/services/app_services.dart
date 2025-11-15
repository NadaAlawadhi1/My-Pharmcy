import 'package:e_commerce/features/authentication/data/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AppServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<AppServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  bool get isFirstTime => sharedPreferences.getBool('is_first_time') ?? true;
  Future<void> setFirstTime(bool value) async =>
      await sharedPreferences.setBool('is_first_time', value);

  bool get isLoggedIn => sharedPreferences.getBool('is_logged_in') ?? false;
  Future<void> setLoggedIn(bool value) async =>
      await sharedPreferences.setBool('is_logged_in', value);

  String? get savedEmail => sharedPreferences.getString('saved_email');
  String? get savedPassword => sharedPreferences.getString('saved_password');

  Future<void> saveCredentials(String email, String password) async {
    await sharedPreferences.setString('saved_email', email);
    await sharedPreferences.setString('saved_password', password);
  }

  Future<void> clearCredentials() async {
    await sharedPreferences.remove('saved_email');
    await sharedPreferences.remove('saved_password');
  }

  Future<void> saveUserData(UserModel user) async {
    await sharedPreferences.setString("id", user.id.toString());
    await sharedPreferences.setString("name", user.name);
    await sharedPreferences.setString("email", user.email);
    await sharedPreferences.setString("approved", user.approved.toString());
    await sharedPreferences.setString("google_id", user.googleId ?? "");
    await sharedPreferences.setString("photo", user.photo ?? "");
    await sharedPreferences.setString("provider", user.provider ?? "");
  }

  UserModel? loadUserData() {
    if (!isLoggedIn) return null;

    final id = sharedPreferences.getString("id");
    if (id == null) return null;

    return UserModel(
      id: int.parse(id),
      name: sharedPreferences.getString("name") ?? "",
      email: sharedPreferences.getString("email") ?? "",
      approved: int.parse(sharedPreferences.getString("approved") ?? "0"),
      googleId: sharedPreferences.getString("google_id"),
      photo: sharedPreferences.getString("photo"),
      provider: sharedPreferences.getString("provider"),
    );
  }

  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut(); // If user used Google
    } catch (_) {}
    await sharedPreferences.clear();
  }
}

Future<void> initServices() async {
  await Get.putAsync<AppServices>(() async => await AppServices().init());
}
