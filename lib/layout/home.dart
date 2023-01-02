import 'package:flutter/material.dart';
import 'package:news/models/categoryData.dart';
import 'package:news/screens/categories_screen.dart';
import 'package:news/screens/home_screen.dart';
import 'package:news/screens/search/search.dart';
import 'package:news/shared/styles/colors.dart';
import '../screens/drawer_screen.dart';
import '../screens/setting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/pattern.png'),
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: colorGreen,
          shape: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          title:  Text(AppLocalizations.of(context)!.news),
          actions: [
            IconButton(onPressed: (){
              showSearch(context: context, delegate: SearchScreen());
            }, icon: Icon(Icons.search,size: 32,))
          ],
        ),
        drawer: DrawerScreen(onDrawerSelected),
        body: selectedDrawer == DrawerScreen.SETTINGS?SettingScreen():
        categoryData == null
            ? CategoriesScreen(onCategorySelected)
            : HomeScreen(categoryData!)
      ),
    );
  }

  CategoryData? categoryData = null;

  void onCategorySelected(categorySelected) {
    categoryData = categorySelected;
    setState(() {});
  }
  int selectedDrawer = DrawerScreen.CATEGORIES;
  void onDrawerSelected(SelectedItemDrawer) {
   selectedDrawer =SelectedItemDrawer;
   categoryData = null;
    print(SelectedItemDrawer);
    setState(() {
      Navigator.pop(context);
    });
  }
}
