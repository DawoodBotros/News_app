import 'package:flutter/material.dart';
import 'package:news/models/categoryData.dart';
import 'package:news/screens/category_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesScreen extends StatelessWidget {
  Function onCategorySelect;

  CategoriesScreen(this.onCategorySelect);

  @override
  Widget build(BuildContext context) {
    var categories = CategoryData.getCategories(context);
    return Column(
      children: [
        Text(
         AppLocalizations.of(context)!.pick_category,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 30),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: GridView.builder(
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  onCategorySelect(categories[index]);
                },
                child: CategoryItem(categories[index], index),
              );
            },
          ),
        )
      ],
    );
  }
}
