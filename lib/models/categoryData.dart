import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryData {
  String id;
  String title;
  String image;
  Color colors;

  CategoryData(this.id, this.title, this.image, this.colors);

  static List<CategoryData> getCategories(BuildContext context) {
    return [
      CategoryData(
        "business",
        AppLocalizations.of(context)!.business,
        "assets/images/bussines.png",
        Color(0xFFC91C22),
      ),
      CategoryData(
        "entertainment",
        AppLocalizations.of(context)!.entertainment,
        "assets/images/entertainment.png",
        Color(0xFF003E90),
      ),
      CategoryData(
        "health",
        AppLocalizations.of(context)!.health,
        "assets/images/health.png",
        Color(0xFFED1E79),
      ),
      CategoryData(
        "science",
        AppLocalizations.of(context)!.science,
        "assets/images/science.png",
        Color(0xFFCF7E48),
      ),
      CategoryData(
        "sports",
        AppLocalizations.of(context)!.sport,
        "assets/images/ball.png",
        Color(0xFF4882CF),
      ),
      CategoryData(
        "technology",
        AppLocalizations.of(context)!.technology,
        "assets/images/technology.png",
        Color(0xFFC91C22),
      ),
      CategoryData(
        "general",
        AppLocalizations.of(context)!.general,
        "assets/images/environment.png",
        Color(0xFF4882CF),
      ),
    ];
  }
}
