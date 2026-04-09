import 'package:flutter/material.dart';
import 'package:movies/core/localization/l10n/app_localizations.dart';
import 'package:movies/core/theme/app_theme.dart';
import 'package:movies/widgets/default_elevated_botton.dart';
import 'package:movies/widgets/default_text_form_field.dart';
import 'package:movies/widgets/ui_utils.dart';

class ForgotPassword extends StatefulWidget {
  static const String routeName = '/forgot-password';

  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppTheme.darkColor.bottom,
          ),
        ),
        title: Text(
          'Forgot Password',
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(color: AppTheme.darkColor.bottom),
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(19),
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

              DefaultElevatedBotton(
                label: appLocalizations.auth_verify_email,
                onPressed: forgotPassword,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void forgotPassword() {
    if (formKey.currentState!.validate()) {
      UiUtils.showSuccessMesssage(
        AppLocalizations.of(context)!.auth_verify_email_message,
      );
    }
  }
}
