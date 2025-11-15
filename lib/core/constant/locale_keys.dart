class LocaleKeys {
  // ---------------------------------------------------------------------------
  // Onboarding Titles
  // Keys for onboarding screen titles (use these to look up localized strings)
  // ---------------------------------------------------------------------------
  static const String onboardingTitle1 = 'onboarding_title_1';
  static const String onboardingTitle2 = 'onboarding_title_2';
  static const String onboardingTitle3 = 'onboarding_title_3';
  static const String onboardingTitle4 = 'onboarding_title_4';

  // ---------------------------------------------------------------------------
  // Onboarding Bodies
  // Keys for onboarding descriptive/body texts
  // ---------------------------------------------------------------------------
  static const String onboardingBody1 = 'onboarding_body_1';
  static const String onboardingBody2 = 'onboarding_body_2';
  static const String onboardingBody3 = 'onboarding_body_3';
  static const String onboardingBody4 = 'onboarding_body_4';

  // ---------------------------------------------------------------------------
  // General Buttons / Navigation
  // Common button labels used across onboarding and other screens
  // ---------------------------------------------------------------------------
  static const String skip = 'skip';
  static const String next = 'next';
  static const String getStarted = 'get_started';

  // ---------------------------------------------------------------------------
  // Sign In / Sign Up Texts
  // Titles and subtitles for authentication screens
  // ---------------------------------------------------------------------------
  static const String signInTitle = 'sign_in_title';
  static const String signInSubtitle = 'sign_in_subtitle';
  static const String signUpTitle = 'Start your health journey';
  static const String signUpSubtitle =
      'Create your account and take the first step toward better health';

  // ---------------------------------------------------------------------------
  // Form Field Labels
  // Labels and small texts used in forms (email, password, etc.)
  // ---------------------------------------------------------------------------
  static const String email = 'email';
  static const String username = 'username';
  static const String password = 'password';
  static const String confirmPassword = 'confirm_password';
  static const String rememberMe = 'remember_me';
  static const String forgotPassword = 'forgot_password';
  static const String orContinueWith = 'or_continue_with';
  static const String alreadyHaveAccount = 'already_have_account';
  static const String dontHaveAccount = 'dont_have_account';

  // ---------------------------------------------------------------------------
  // Auth Buttons
  // Explicit labels for sign actions
  // ---------------------------------------------------------------------------
  static const String signUp = 'sign_up';
  static const String signIn = 'sign_in';

  // ---------------------------------------------------------------------------
  // Forget Password / Check Email Flow
  // Titles and labels used in the password recovery flow
  // ---------------------------------------------------------------------------
  static const String forgetPasswordTitle = 'forget_password_title';
  static const String checkEmailTitle = 'check_email_title';
  static const String checkEmailSubtitle = 'check_email_subtitle';
  static const String check = 'check';

  // ---------------------------------------------------------------------------
  // Reset Password
  // Keys used in reset password screens and success confirmation
  // ---------------------------------------------------------------------------
  static const String resetPasswordTitle = 'reset_password_title';
  static const String resetPasswordSubtitle = 'reset_password_subtitle';
  static const String newPassword = 'new_password';
  static const String resetPasswordButton = 'reset_password_button';

  static const String passwordResetTitle = 'password_reset_title';
  static const String passwordResetSubtitle = 'password_reset_subtitle';
  static const String goToSignIn = 'go_to_sign_in';

  // ---------------------------------------------------------------------------
  // Verification Code
  // Keys for verification / OTP screens
  // ---------------------------------------------------------------------------
  static const String verificationCodeTitle = 'verification_code_title';
  static const String verificationCodeSubtitle = 'verification_code_subtitle';
  static const String resendCodeText = 'resend_code_text';

  // ---------------------------------------------------------------------------
  // Check Inbox / Email Verification
  // Messages shown after sending verification / confirmation emails
  // ---------------------------------------------------------------------------
  static const String checkInboxTitle = 'check_inbox_title';
  static const String checkInboxSubtitle = 'check_inbox_subtitle';
  static const String defaultEmail = 'default_email';
  static const String verifyToContinue = 'verify_to_continue';
  static const String verifiedEmailButton = 'verified_email_button';
  static const String resendEmail = 'resend_email';
  static const String emailSent = 'email_sent';
  static const String verificationLinkResent = 'verification_link_resent';

  // ---------------------------------------------------------------------------
  // Validation / Error Messages
  // Keys for simple validation messages used in forms
  // ---------------------------------------------------------------------------
  static const String emailRequired = "email_required";
  static const String passwordRequired = "password_required";
  static const String confirmPasswordRequired = "confirm_password_required";
  static const String invalidEmail = "invalid_email";
  static const String passwordMismatch = "password_mismatch";

  // Username validation key (used by Validation.validateUsername)
  static const String usernameRequired = "username_required";

  // Newly added keys required by validation.dart
  static const String passwordTooShort = "password_too_short";
  static const String passwordInvalid = "password_invalid";
  static const String fieldRequired = "field_required";
  static const String minLength = "min_length";
  static const String maxLength = "max_length";

  // Network Connection Messages
  static const String noInternetConnection = "no_internet_connection";

  static const String continueWithGoogle = "continue_with_google";

  static const String sending = "sending";
  static const String resendIn = "resend_in";
  static const String resendCode = "resend_code";
  // ---------------------------------------------------------------------------
  // Snackbars / messages
  // ---------------------------------------------------------------------------
  static const String invalidCode = "invalid_code";
  static const String invalidCodeMessage = "invalid_code_message";

  static const String success = "success";
  static const String codeVerified = "code_verified";

  static const String error = "error";
  static const String couldNotResendCode = "could_not_resend_code";
  static const String newCodeSent = "new_code_sent";

  static const String emailExists = "email_exists";
  static const String useAnotherEmail = "use_another_email";
  static const String verifyYourAccount = "verify_your_account";
  static const String newCodeSentEmail = "new_code_sent_email";
  static const String offline = "offline";
  static const String noInternet = "no_internet";
  static const String serverError = "server_error";
  static const String somethingWentWrong = "something_went_wrong";
  static const String unexpectedIssue = "unexpected_issue";

  static const String accountNotVerified = "account_not_verified";
  static const String signUpAgain = "sign_up_again";
  static const String loginFailed = "login_failed";
  static const String invalidEmailOrPassword = "invalid_email_or_password";

  static const String welcomeUser = "welcome_user";
  static const String helloUser = "hello_user";

  static const String couldNotResetPassword = "could_not_reset_password";
  static const String passwordResetSuccessfully = "password_reset_successfully";

  static const String couldntSendResetCode = "couldnt_send_reset_code";
  static const String codeSent = "code_sent";
  static const String checkYourEmail = "check_your_email";

  static const String welcome = "welcome";
  static const String loggedInAs = "logged_in_as";
  static const String googleError = "google_error";
  static const String pleaseVerifyEmail = "please_verify_email";
  static const String hello = "hello";
  // Reset Password Snackbars
  static const String passwordResetFailed = "password_reset_failed";
  static const String passwordResetSuccess = "password_reset_success";

  // Google Sign-In Snackbars
  static const String googleSignInCancelled = "google_sign_in_cancelled";
  static const String googleSignInError = "google_sign_in_error";
  // LocaleKeys.dart
  static const String home = "home";
  static const String logout = "logout";
  static const String welcomeBack = "welcome_back";
  static const String loggedInSuccess = "logged_in_success";
  static const String unexpectedResponseErrorMessage =
      "unexpected_response_error_message";
}
