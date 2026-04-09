import 'package:flutter/material.dart';
import 'package:movies/core/localization/l10n/app_localizations.dart';
import 'package:movies/core/services/providers/main_provider.dart';
import 'package:movies/core/services/providers/setting_provider.dart';
import 'package:movies/core/theme/app_theme.dart';
import 'package:movies/views/auth/forgot_password.dart';
import 'package:movies/views/auth/login_screen.dart';
import 'package:movies/views/auth/register_screen.dart';
import 'package:movies/views/main/main_screen.dart';
import 'package:movies/views/movie_details/movie_details_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
        ChangeNotifierProvider(create: (_) => MainProvider()),
      ],
      child: Movies(),
    ),
  );
}

class Movies extends StatelessWidget {
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        MainScreen.routeName: (_) => MainScreen(),
        MovieDetailsScreen.routeName: (_) => MovieDetailsScreen(),

        LoginScreen.routeName: (_) => LoginScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        ForgotPassword.routeName: (_) => ForgotPassword(),
      },
      initialRoute: MainScreen.routeName,

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: settingsProvider.languageCode == null
          ? null
          : Locale(settingsProvider.languageCode!),

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settingsProvider.themeMode,
    );
  }
}
