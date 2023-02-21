import 'package:flutter/material.dart';
import 'package:news/layout/home.dart';
import 'package:news/provider/my_provider.dart';
import 'package:news/screens/details/details.dart';
import 'package:news/screens/setting.dart';
import 'package:news/screens/splash/splash_screen.dart';
import 'package:news/shared/styles/my_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(

      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en' ), // English, no country code
        Locale('ar' ), // Arabic, no country code
      ],
      locale: Locale(provider.language),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        SettingScreen.routeName: (context) => SettingScreen(),
        HomeLayout.routeName: (context) => HomeLayout(),
        NewsDetailsScreen.routeName: (context) => NewsDetailsScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
