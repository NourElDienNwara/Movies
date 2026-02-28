// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get auth_login => 'تسجيل الدخول';

  @override
  String get auth_register => 'إنشاء حساب';

  @override
  String get auth_name => 'Name';

  @override
  String get auth_valid_name_empty => 'Please enter your name';

  @override
  String get auth_email => 'البريد الإلكتروني';

  @override
  String get auth_valid_email_empty => 'من فضلك أدخل بريدك الإلكتروني';

  @override
  String get auth_valid_email_correct =>
      'من فضلك أدخل بريدًا إلكترونيًا صحيحًا';

  @override
  String get auth_password => 'كلمة المرور';

  @override
  String get auth_confirm_password => 'تأكيد كلمة المرور';

  @override
  String get auth_valid_password_character =>
      'يجب أن تكون كلمة المرور 6 أحرف على الأقل';

  @override
  String get auth_valid_password_empty => 'يجب ألا تكون كلمة المرور فارغة';

  @override
  String get auth_valid_confirm_password_match => 'Passwords do not match';

  @override
  String get auth_phone => 'Phone';

  @override
  String get auth_valid_phone_empty => 'Please enter your phone number';

  @override
  String get auth_valid_phone_correct => 'Please enter a valid phone number';

  @override
  String get auth_forgot_password => 'هل نسيت كلمة المرور؟';

  @override
  String get auth_no_account => 'ليس لديك حساب؟ ';

  @override
  String get auth_create_account => 'أنشئ حسابًا';

  @override
  String get auth_have_account => 'لديك حساب بالفعل؟ ';

  @override
  String get auth_login_with_google => 'تسجيل الدخول باستخدام جوجل';

  @override
  String get auth_or => 'أو';

  @override
  String get auth_success_login => 'تم تسجيل الدخول بنجاح';

  @override
  String get auth_success_register => 'تم إنشاء الحساب بنجاح';

  @override
  String get auth_verify_email => 'Verify Your Email';

  @override
  String get auth_verify_email_message =>
      'A verification email has been sent to your email address.';
}
