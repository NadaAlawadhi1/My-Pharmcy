const String baseUrl = "http://localhost/ecommerce";

class ApiLink {
  static const String base = baseUrl;

  static const String signup = "$baseUrl/auth/sign_up.php";
  static const String verifyCode = "$baseUrl/auth/verify_code.php";
  static const String signIn = "$baseUrl/auth/sign_in.php";
  static const String forgetPassword = "$baseUrl/auth/forget_password.php";
  static const String forgetResetPassword = "$baseUrl/auth/forget_reset_password.php";

  // GOOGLE
  static const String googleLogin = "$baseUrl/auth/google_login.php";
}
