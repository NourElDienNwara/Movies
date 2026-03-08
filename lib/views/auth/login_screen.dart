import 'package:flutter/material.dart';
import 'package:movies/core/localization/l10n/app_localizations.dart';
import 'package:movies/core/theme/app_theme.dart';
import 'package:movies/views/auth/forgot_password.dart';
import 'package:movies/views/auth/register_screen.dart';
import 'package:movies/views/main/main_screen.dart';
import 'package:movies/widgets/default_elevated_botton.dart';
import 'package:movies/widgets/default_text_form_field.dart';
import 'package:movies/widgets/ui_utils.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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

                Row(
                  mainAxisAlignment: .end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushNamed(ForgotPassword.routeName);
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(1, 1),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        appLocalizations.auth_forgot_password,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 35),

                DefaultElevatedBotton(
                  label: appLocalizations.auth_login,
                  onPressed: login,
                ),

                SizedBox(height: 22),

                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      appLocalizations.auth_no_account,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppTheme.darkColor.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(RegisterScreen.routeName);
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(1, 1),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        appLocalizations.auth_create_account,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 22),

                Row(
                  children: [
                    Expanded(child: Divider(color: AppTheme.darkColor.bottom)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        appLocalizations.auth_or,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Expanded(child: Divider(color: AppTheme.darkColor.bottom)),
                  ],
                ),

                SizedBox(height: 22),

                DefaultElevatedBotton(
                  label: appLocalizations.auth_login_with_google,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
      UiUtils.showSuccessMesssage(
        AppLocalizations.of(context)!.auth_success_login,
      );
    }
  }
}
