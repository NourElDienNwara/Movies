// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get auth_login => 'Login';

  @override
  String get auth_register => 'Register';

  @override
  String get auth_name => 'Name';

  @override
  String get auth_valid_name_empty => 'Please enter your name';

  @override
  String get auth_email => 'Email';

  @override
  String get auth_valid_email_empty => 'Please enter your email';

  @override
  String get auth_valid_email_correct => 'Please enter a valid email';

  @override
  String get auth_password => 'Password';

  @override
  String get auth_confirm_password => 'Confirm Password';

  @override
  String get auth_valid_password_character =>
      'Password must be at least 6 characters';

  @override
  String get auth_valid_password_empty => 'Password must not be empty';

  @override
  String get auth_valid_confirm_password_match => 'Passwords do not match';

  @override
  String get auth_phone => 'Phone';

  @override
  String get auth_valid_phone_empty => 'Please enter your phone number';

  @override
  String get auth_valid_phone_correct => 'Please enter a valid phone number';

  @override
  String get auth_forgot_password => 'Forgot Password?';

  @override
  String get auth_no_account => 'Don\'t have an account? ';

  @override
  String get auth_create_account => 'Create One';

  @override
  String get auth_have_account => 'Already have an account? ';

  @override
  String get auth_login_with_google => 'Login With Google';

  @override
  String get auth_or => 'OR';

  @override
  String get auth_success_login => 'Login successful';

  @override
  String get auth_success_register => 'Register successful';

  @override
  String get auth_verify_email => 'Verify Your Email';

  @override
  String get auth_verify_email_message =>
      'A verification email has been sent to your email address.';
}
