import 'package:flutter/material.dart';
import 'package:news/screens/setting.dart';
import 'package:news/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerScreen extends StatelessWidget {
  Function onDrawerSelected;

  DrawerScreen(this.onDrawerSelected);

  static const int CATEGORIES = 1;
  static const int SETTINGS = 2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.080),
              height: MediaQuery.of(context).size.height * 0.3,
              color: colorGreen,
              child: Text(
                AppLocalizations.of(context)!.news,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontSize: 30, color: Colors.white),
              ),
            ),
            InkWell(
              onTap: (){
                onDrawerSelected(CATEGORIES);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                 AppLocalizations.of(context)!.category,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontSize: 30,fontWeight: FontWeight.bold
                      ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: (){
                onDrawerSelected(SETTINGS);

              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppLocalizations.of(context)!.setting,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontSize: 30,fontWeight: FontWeight.bold
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
