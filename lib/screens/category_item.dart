import 'package:flutter/material.dart';
import 'package:news/models/categoryData.dart';
import 'package:news/provider/my_provider.dart';
import 'package:provider/provider.dart';
class CategoryItem extends StatelessWidget {
  CategoryData categoryData;
  int index;

  CategoryItem(this.categoryData, this.index);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyProvider(),
      builder: (context, child) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          decoration: BoxDecoration(
            color: categoryData.colors,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomRight: index.isOdd ? Radius.circular(25) : Radius.zero,
                bottomLeft: index.isEven ? Radius.circular(25) : Radius.zero),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  categoryData.image,
                  height: 115,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    categoryData.title ,
                    style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
