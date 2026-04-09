import 'package:flutter/material.dart';
import 'package:movies/core/localization/l10n/app_localizations.dart';
import 'package:movies/core/theme/app_theme.dart';
import 'package:movies/views/auth/login_screen.dart';
import 'package:movies/views/main/main_screen.dart';
import 'package:movies/widgets/default_elevated_botton.dart';
import 'package:movies/widgets/default_text_form_field.dart';
import 'package:movies/widgets/ui_utils.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(19),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                DefaultTextFormField(
                  hintText: appLocalizations.auth_name,
                  prefixIcon: 'person',
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return appLocalizations.auth_valid_name_empty;
                    }
                    return null;
                  },
                ),

                SizedBox(height: 22),

                DefaultTextFormField(
                  hintText: appLocalizations.auth_email,
                  prefixIcon: 'email',
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return appLocalizations.auth_valid_email_empty;
                    } else if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return appLocalizations.auth_valid_email_correct;
                    }
                    return null;
                  },
                ),

                SizedBox(height: 22),

                DefaultTextFormField(
                  hintText: appLocalizations.auth_password,
                  prefixIcon: 'password',
                  isPassword: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return appLocalizations.auth_valid_password_empty;
                    } else if (value.length < 6) {
                      return appLocalizations.auth_valid_password_character;
                    }
                    return null;
                  },
                ),

                SizedBox(height: 22),

                DefaultTextFormField(
                  hintText: appLocalizations.auth_confirm_password,
                  prefixIcon: 'password',
                  isPassword: true,
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return appLocalizations.auth_valid_password_empty;
                    } else if (value != passwordController.text) {
                      return appLocalizations.auth_valid_confirm_password_match;
                    }
                    return null;
                  },
                ),

                SizedBox(height: 22),

                DefaultTextFormField(
                  hintText: appLocalizations.auth_phone,
                  prefixIcon: 'phone',
                  controller: phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return appLocalizations.auth_valid_phone_empty;
                    } else if (!RegExp(r'^\+?[0-9]{11,11}$').hasMatch(value)) {
                      return appLocalizations.auth_valid_phone_correct;
                    }
                    return null;
                  },
                ),

                SizedBox(height: 35),

                DefaultElevatedBotton(
                  label: appLocalizations.auth_register,
                  onPressed: register,
                ),

                SizedBox(height: 22),

                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      appLocalizations.auth_have_account,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppTheme.darkColor.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(LoginScreen.routeName);
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(1, 1),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        appLocalizations.auth_login,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
      UiUtils.showSuccessMesssage(
        AppLocalizations.of(context)!.auth_success_register,
      );
    }
  }
}
