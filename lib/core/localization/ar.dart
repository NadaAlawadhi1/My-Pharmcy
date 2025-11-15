import 'package:e_commerce/core/constant/locale_keys.dart';

/// Arabic localization map
const Map<String, String> ar = {
  // ---------------------------------------------------------------------------
  // Onboarding
  // ---------------------------------------------------------------------------
  LocaleKeys.onboardingTitle1: "اختر دواءك",
  LocaleKeys.onboardingBody1:
      "تصفح الأدوية والمكملات الصحية الموثوقة بسهولة، مرتبة حسب الفئات لتجد ما تحتاجه بسرعة.",

  LocaleKeys.onboardingTitle2: "دفع آمن وسهل",
  LocaleKeys.onboardingBody2:
      "أكمل طلباتك بثقة مع نظام دفع مشفر وبسيط. بياناتك وخصوصيتك في أمان تام.",

  LocaleKeys.onboardingTitle3: "تتبع طلبك",
  LocaleKeys.onboardingBody3:
      "ابقَ على اطلاع لحظة بلحظة من التحضير حتى التوصيل. ستعرف دائمًا مكان طلبك وموعد وصوله.",

  LocaleKeys.onboardingTitle4: "توصيل سريع وموثوق",
  LocaleKeys.onboardingBody4:
      "نوصلك بمنتجاتك الصحية بسرعة وأمان إلى باب منزلك — صحتك لا يجب أن تنتظر.",

  // ---------------------------------------------------------------------------
  // Buttons / Navigation
  // ---------------------------------------------------------------------------
  LocaleKeys.skip: "تخطي",
  LocaleKeys.next: "التالي",
  LocaleKeys.getStarted: "ابدأ الآن",

  // ---------------------------------------------------------------------------
  // Authentication Titles / Subtitles
  // ---------------------------------------------------------------------------
  LocaleKeys.signInTitle: "مرحبًا بعودتك",
  LocaleKeys.signInSubtitle:
      "قم بتسجيل الدخول لإدارة وصفاتك الطبية، وتتبع طلباتك، والبقاء على اطلاع باحتياجاتك الصحية.",

  LocaleKeys.signUpTitle: "انضم إلينا",
  LocaleKeys.signUpSubtitle:
      "أنشئ حسابك للاستفادة من خدمات صحية سلسة وتجربة صيدلية مخصصة لك.",

  // ---------------------------------------------------------------------------
  // Auth Fields
  // ---------------------------------------------------------------------------
  LocaleKeys.email: "البريد الإلكتروني",
  LocaleKeys.username: "اسم المستخدم",
  LocaleKeys.password: "كلمة المرور",
  LocaleKeys.confirmPassword: "تأكيد كلمة المرور",
  LocaleKeys.rememberMe: "تذكرني",
  LocaleKeys.forgotPassword: "نسيت كلمة المرور؟",
  LocaleKeys.orContinueWith: "أو",
  LocaleKeys.alreadyHaveAccount: "لديك حساب بالفعل؟ ",
  LocaleKeys.dontHaveAccount: "ليس لديك حساب؟ ",
  LocaleKeys.signUp: "إنشاء حساب",
  LocaleKeys.signIn: "تسجيل الدخول",

  // ---------------------------------------------------------------------------
  // Forget Password & Check Email
  // ---------------------------------------------------------------------------
  LocaleKeys.forgetPasswordTitle: "نسيت كلمة المرور",
  LocaleKeys.checkEmailTitle: "تحقق من البريد الإلكتروني",
  LocaleKeys.checkEmailSubtitle:
      "أدخل بريدك الإلكتروني وسنرسل إليك رمز تحقق لإعادة تعيين كلمة المرور.",
  LocaleKeys.check: "تحقق",

  // ---------------------------------------------------------------------------
  // Reset Password
  // ---------------------------------------------------------------------------
  LocaleKeys.resetPasswordTitle: "إعادة تعيين كلمة المرور",
  LocaleKeys.resetPasswordSubtitle: "أدخل كلمة مرور جديدة ثم أكدها",
  LocaleKeys.newPassword: "كلمة المرور الجديدة",
  LocaleKeys.resetPasswordButton: "إعادة تعيين",

  // ---------------------------------------------------------------------------
  // Password Reset Success
  // ---------------------------------------------------------------------------
  LocaleKeys.passwordResetTitle: "تم تغيير كلمة المرور",
  LocaleKeys.passwordResetSubtitle: "تم تغيير كلمة مرورك بنجاح.",
  LocaleKeys.goToSignIn: "الذهاب إلى تسجيل الدخول",

  // ---------------------------------------------------------------------------
  // Verification / OTP
  // ---------------------------------------------------------------------------
  LocaleKeys.verificationCodeTitle: "رمز التحقق",
  LocaleKeys.verificationCodeSubtitle:
      "أدخل رمز التحقق المكون من 6 أرقام الذي أُرسل إلى بريدك الإلكتروني",
  LocaleKeys.resendCodeText: "لم يصلك الرمز؟ أعد الإرسال",

  // ---------------------------------------------------------------------------
  // Check Inbox
  // ---------------------------------------------------------------------------
  LocaleKeys.checkInboxTitle: "تحقق من بريدك الوارد",
  LocaleKeys.checkInboxSubtitle: "لقد أرسلنا رابط التحقق إلى",
  LocaleKeys.defaultEmail: "بريدك الإلكتروني",
  LocaleKeys.verifyToContinue: "يرجى التحقق للمتابعة.",
  LocaleKeys.verifiedEmailButton: "لقد تحققت من بريدي الإلكتروني",
  LocaleKeys.resendEmail: "إعادة إرسال البريد",
  LocaleKeys.emailSent: "تم إرسال البريد الإلكتروني",
  LocaleKeys.verificationLinkResent: "تم إعادة إرسال رابط التحقق.",

  // ---------------------------------------------------------------------------
  // Validation / Errors
  // ---------------------------------------------------------------------------
  LocaleKeys.emailRequired: "البريد الإلكتروني مطلوب",
  LocaleKeys.passwordRequired: "كلمة المرور مطلوبة",
  LocaleKeys.confirmPasswordRequired: "تأكيد كلمة المرور مطلوب",
  LocaleKeys.invalidEmail: "أدخل بريدًا إلكترونيًا صحيحًا",
  LocaleKeys.passwordMismatch: "كلمات المرور غير متطابقة",

  LocaleKeys.usernameRequired: "اسم المستخدم مطلوب",

  // New validations
  LocaleKeys.passwordTooShort:
      "كلمة المرور قصيرة جدًا (الحد الأدنى @min حرفًا)",
  LocaleKeys.passwordInvalid: "يجب أن تحتوي كلمة المرور على أحرف وأرقام",
  LocaleKeys.fieldRequired: "مطلوب",
  LocaleKeys.minLength: "يجب أن يكون الطول لا يقل عن @min حرف",
  LocaleKeys.maxLength: "يجب أن يكون الطول لا يزيد عن @max حرف",

  // ---------------------------------------------------------------------------
  // Network
  // ---------------------------------------------------------------------------
  LocaleKeys.noInternetConnection: " لا يوجد اتصال بالإنترنت",

  // Google Auth
  LocaleKeys.continueWithGoogle: "المتابعة باستخدام جوجل",

  // OTP resend timer
  LocaleKeys.sending: "جاري الإرسال...",
  LocaleKeys.resendIn: "إعادة الإرسال خلال @seconds ثانية",
  LocaleKeys.resendCode: "إعادة إرسال الرمز",

  // Code validation
  LocaleKeys.invalidCode: "رمز غير صحيح",
  LocaleKeys.invalidCodeMessage: "يرجى إدخال الرمز الصحيح.",

  LocaleKeys.success: "نجاح",
  LocaleKeys.codeVerified: "تم التحقق من الرمز بنجاح!",

  LocaleKeys.error: "خطأ",
  LocaleKeys.couldNotResendCode: "تعذّر إعادة إرسال الرمز",
  LocaleKeys.newCodeSent: "تم إرسال رمز جديد!",

  LocaleKeys.emailExists: "هذا البريد الإلكتروني مسجل بالفعل",
  LocaleKeys.useAnotherEmail: "يرجى استخدام بريد إلكتروني آخر",
  LocaleKeys.verifyYourAccount: "تحقق من حسابك",
  LocaleKeys.newCodeSentEmail: "تم إرسال رمز جديد إلى بريدك الإلكتروني",

  LocaleKeys.offline: "غير متصل",
  LocaleKeys.noInternet: "لا يوجد اتصال بالإنترنت",
  LocaleKeys.serverError: "خطأ في الخادم",
  LocaleKeys.somethingWentWrong: "حدث خطأ، حاول مرة أخرى",
  LocaleKeys.unexpectedIssue: "حدثت مشكلة غير متوقعة",

  // Auth state issues
  LocaleKeys.accountNotVerified: "الحساب غير مفعل",
  LocaleKeys.signUpAgain: "يرجى التسجيل مرة أخرى",
  LocaleKeys.loginFailed: "فشل تسجيل الدخول",
  LocaleKeys.invalidEmailOrPassword:
      "البريد الإلكتروني أو كلمة المرور غير صحيحة",

  // Welcome messages
  LocaleKeys.welcomeUser: "نجاح",
  LocaleKeys.helloUser: "مرحبًا @name!",

  // Password reset
  LocaleKeys.couldNotResetPassword: "تعذّر إعادة تعيين كلمة المرور",
  LocaleKeys.passwordResetSuccessfully: "تم إعادة تعيين كلمة المرور بنجاح",
  LocaleKeys.couldntSendResetCode: "تعذّر إرسال رمز إعادة التعيين",
  LocaleKeys.codeSent: "تم إرسال الرمز",
  LocaleKeys.checkYourEmail: "تحقق من بريدك الإلكتروني",

  LocaleKeys.welcome: "مرحبًا!",
  LocaleKeys.loggedInAs: "تم تسجيل الدخول كـ @name",

  // Google sign-in
  LocaleKeys.googleError: "خطأ في تسجيل الدخول بواسطة Google",
  LocaleKeys.pleaseVerifyEmail: "يرجى التحقق من بريدك الإلكتروني",
  LocaleKeys.hello: "أهلاً",
  LocaleKeys.passwordResetFailed: "تعذّر إعادة تعيين كلمة المرور",
  LocaleKeys.passwordResetSuccess: "تم إعادة تعيين كلمة المرور بنجاح",
  LocaleKeys.googleSignInCancelled: "تم إلغاء تسجيل الدخول باستخدام Google",
  LocaleKeys.googleSignInError: "حدث خطأ أثناء تسجيل الدخول باستخدام Google",

  // ---------------------------------------------------------------------------
  // Home
  // ---------------------------------------------------------------------------
  LocaleKeys.home: "الرئيسية",
  LocaleKeys.logout: "تسجيل الخروج",
  LocaleKeys.welcomeBack: "مرحبًا بعودتك!",
  LocaleKeys.loggedInSuccess: "تم تسجيل الدخول بنجاح.",
  LocaleKeys.unexpectedResponseErrorMessage:
      "استجابة غير متوقعة: بيانات المستخدم مفقودة.",
};
