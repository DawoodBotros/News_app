import 'package:flutter/material.dart';
import 'package:news/layout/home.dart';
import 'package:news/screens/setting.dart';
import 'package:news/shared/styles/my_theme.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeLayout.routeName,
       routes: {
        SettingScreen.routeName : (context) => SettingScreen(),
        HomeLayout.routeName : (context) => HomeLayout(),
       },
      debugShowCheckedModeBanner: false,
    );
  }
}


