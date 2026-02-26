import 'package:flutter/material.dart';
import 'package:movies/core/localization/l10n/app_localizations.dart';
import 'package:movies/core/services/providers/setting_provider.dart';
import 'package:movies/core/theme/app_theme.dart';
import 'package:movies/views/main/main_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(
    MultiProvider(providers: [ChangeNotifierProvider(create: (_) => SettingsProvider(),),], child: Movies(),),
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
