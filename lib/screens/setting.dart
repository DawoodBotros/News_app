import 'package:flutter/material.dart';
import 'package:news/models/categoryData.dart';
import 'package:news/models/sources.dart';
import 'package:news/provider/my_provider.dart';
import 'package:news/screens/categories_screen.dart';
import 'package:news/screens/drawer_screen.dart';
import 'package:news/shared/network/remote/api_manager.dart';
import 'package:news/shared/styles/colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = "setting";

  String lang = "English";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                "assets/images/pattern.png",
                fit: BoxFit.cover,
              )),
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                AppLocalizations.of(context)!.language,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: colorGreen, fontSize: 35),
              ),
              Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.symmetric(vertical: 30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colorGreen)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      value: provider.language == "en"
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      items: [
                        AppLocalizations.of(context)!.english,
                        AppLocalizations.of(context)!.arabic
                      ]
                          .map((e) => DropdownMenuItem(
                                child: Text("$e"),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (String? value) {
                        value == AppLocalizations.of(context)!.english
                            ? provider.ChangeLangu("en")
                            : provider.ChangeLangu("ar");
                      },
                    ),
                  )),
            ]),
          ),
        ],
      ),
    );
  }
}
