import 'package:e_commerce/core/constant/locale_keys.dart';

/// English localization map
const Map<String, String> en = {
  // ---------------------------------------------------------------------------
  // Onboarding
  // ---------------------------------------------------------------------------
  LocaleKeys.onboardingTitle1: "Choose Your Medicine",
  LocaleKeys.onboardingBody1:
      "Browse trusted medicines, vitamins, and health essentials — all organized by category to help you find what you need effortlessly.",

  LocaleKeys.onboardingTitle2: "Secure & Easy Payment",
  LocaleKeys.onboardingBody2:
      "Complete your orders confidently with our encrypted and simple payment process. Your data and privacy are always protected.",

  LocaleKeys.onboardingTitle3: "Track Your Order",
  LocaleKeys.onboardingBody3:
      "Stay updated in real time — from preparation to delivery. You’ll always know exactly where your order is and when it arrives.",

  LocaleKeys.onboardingTitle4: "Fast & Reliable Delivery",
  LocaleKeys.onboardingBody4:
      "Get your health products delivered quickly and safely to your door. Because your well-being should never have to wait.",

  // ---------------------------------------------------------------------------
  // Buttons / Navigation
  // ---------------------------------------------------------------------------
  LocaleKeys.skip: "Skip",
  LocaleKeys.next: "Next",
  LocaleKeys.getStarted: "Get Started",

  // ---------------------------------------------------------------------------
  // Authentication Titles / Subtitles
  // ---------------------------------------------------------------------------
  LocaleKeys.signInTitle: "Welcome back",
  LocaleKeys.signInSubtitle:
      "Log in to manage your prescriptions, check your orders, and stay on top of your health needs.",

  LocaleKeys.signUpTitle: "Join us",
  LocaleKeys.signUpSubtitle:
      "Create your account to enjoy seamless health services and a personalized pharmacy experience.",

  // ---------------------------------------------------------------------------
  // Auth Fields
  // ---------------------------------------------------------------------------
  LocaleKeys.email: "E-mail",
  LocaleKeys.username: "Username",
  LocaleKeys.password: "Password",
  LocaleKeys.confirmPassword: "Confirm password",
  LocaleKeys.rememberMe: "Remember me",
  LocaleKeys.forgotPassword: "Forgot Password?",
  LocaleKeys.orContinueWith: "or",
  LocaleKeys.alreadyHaveAccount: "Already have an account? ",
  LocaleKeys.dontHaveAccount: "Don’t have an account? ",
  LocaleKeys.signUp: "Sign up",
  LocaleKeys.signIn: "Sign in",

  // ---------------------------------------------------------------------------
  // Forget Password & Check Email
  // ---------------------------------------------------------------------------
  LocaleKeys.forgetPasswordTitle: "Forget Password",
  LocaleKeys.checkEmailTitle: "Check Email",
  LocaleKeys.checkEmailSubtitle:
      "Enter your email address and we’ll send you a verification code to reset your password.",
  LocaleKeys.check: "Check",

  // ---------------------------------------------------------------------------
  // Reset Password
  // ---------------------------------------------------------------------------
  LocaleKeys.resetPasswordTitle: "Reset Password",
  LocaleKeys.resetPasswordSubtitle: "Enter and confirm your new password",
  LocaleKeys.newPassword: "New Password",
  LocaleKeys.resetPasswordButton: "Reset Password",

  // ---------------------------------------------------------------------------
  // Password Reset Success
  // ---------------------------------------------------------------------------
  LocaleKeys.passwordResetTitle: "Password Reset",
  LocaleKeys.passwordResetSubtitle:
      "Your password has been changed successfully.",
  LocaleKeys.goToSignIn: "Go to Sign In",

  // ---------------------------------------------------------------------------
  // Verification / OTP
  // ---------------------------------------------------------------------------
  LocaleKeys.verificationCodeTitle: "Verification Code",
  LocaleKeys.verificationCodeSubtitle:
      "Enter the 6-digit verification code sent to your email",
  LocaleKeys.resendCodeText: "Didn’t receive code? Resend",

  // ---------------------------------------------------------------------------
  // Check Inbox
  // ---------------------------------------------------------------------------
  LocaleKeys.checkInboxTitle: "Check Your Inbox",
  LocaleKeys.checkInboxSubtitle: "We sent a verification link to",
  LocaleKeys.defaultEmail: "your email address",
  LocaleKeys.verifyToContinue: "Please verify to continue.",
  LocaleKeys.verifiedEmailButton: "I Verified My Email",
  LocaleKeys.resendEmail: "Resend Email",
  LocaleKeys.emailSent: "Email Sent",
  LocaleKeys.verificationLinkResent: "Verification link resent.",

  // ---------------------------------------------------------------------------
  // Validation / Errors
  // ---------------------------------------------------------------------------
  LocaleKeys.emailRequired: "Email is required",
  LocaleKeys.passwordRequired: "Password is required",
  LocaleKeys.confirmPasswordRequired: "Confirm Password is required",
  LocaleKeys.invalidEmail: "Enter a valid email address",
  LocaleKeys.passwordMismatch: "Passwords do not match",
  LocaleKeys.usernameRequired: "Username is required",

  // New validations
  LocaleKeys.passwordTooShort: "Password is too short (minimum 6 characters)",
  LocaleKeys.passwordInvalid: "Password must contain letters and numbers",
  LocaleKeys.fieldRequired: "is required",
  LocaleKeys.minLength: "must be at least @min characters",
  LocaleKeys.maxLength: "must be at most @max characters",

  // Network
  LocaleKeys.noInternetConnection: "No internet connection",

  // Google Auth
  LocaleKeys.continueWithGoogle: "Continue with Google",

  // OTP resend timer
  LocaleKeys.sending: "Sending...",
  LocaleKeys.resendIn: "Resend in @seconds s",
  LocaleKeys.resendCode: "Resend Code",

  // Code validation
  LocaleKeys.invalidCode: "Invalid Code",
  LocaleKeys.invalidCodeMessage: "Please enter the correct code.",

  LocaleKeys.success: "Success",
  LocaleKeys.codeVerified: "Code verified successfully!",

  LocaleKeys.error: "Error",
  LocaleKeys.couldNotResendCode: "Could not resend code",
  LocaleKeys.newCodeSent: "New code sent!",

  // Email errors
  LocaleKeys.emailExists: "This email is already registered",
  LocaleKeys.useAnotherEmail: "Please use another email address",
  LocaleKeys.verifyYourAccount: "Verify Your Account",
  LocaleKeys.newCodeSentEmail: "A new code has been sent to your email",

  // General errors
  LocaleKeys.offline: "Offline",
  LocaleKeys.noInternet: "No internet connection",
  LocaleKeys.serverError: "Server Error",
  LocaleKeys.somethingWentWrong: "Something went wrong, please try again",
  LocaleKeys.unexpectedIssue: "Unexpected issue occurred",

  // Auth state issues
  LocaleKeys.accountNotVerified: "Account not verified",
  LocaleKeys.signUpAgain: "Please sign up again",
  LocaleKeys.loginFailed: "Login failed",
  LocaleKeys.invalidEmailOrPassword: "Invalid email or password",

  // Welcome messages
  LocaleKeys.welcomeUser: "Success",
  LocaleKeys.helloUser: "Hello @name!",

  // Password reset
  LocaleKeys.couldNotResetPassword: "Could not reset password",
  LocaleKeys.passwordResetSuccessfully: "Password reset successfully",
  LocaleKeys.couldntSendResetCode: "Couldn't send reset code",
  LocaleKeys.codeSent: "Code Sent",
  LocaleKeys.checkYourEmail: "Check your email",

  LocaleKeys.welcome: "Welcome!",
  LocaleKeys.loggedInAs: "Logged in as @name",

  // Google sign-in
  LocaleKeys.googleError: "Google Error",
  LocaleKeys.pleaseVerifyEmail: "Please verify your email",
  LocaleKeys.hello: "Hello",
  LocaleKeys.passwordResetFailed: "Could not reset password",
  LocaleKeys.passwordResetSuccess: "Password reset successfully",
  LocaleKeys.googleSignInCancelled: "Google sign-in cancelled",
  LocaleKeys.googleSignInError: "Google sign-in error",

  // ---------------------------------------------------------------------------
  // Home 
  // ---------------------------------------------------------------------------
  LocaleKeys.home: "Home",
  LocaleKeys.logout: "Logout",
  LocaleKeys.welcomeBack: "Welcome Back!",
  LocaleKeys.loggedInSuccess: "You are logged in successfully.",
  LocaleKeys.unexpectedResponseErrorMessage:
      "Unexpected response: User data missing.",
};
