import 'package:flutter/material.dart';



class MyProvider extends ChangeNotifier {
  int selectedIndex = 0;
  String language = "en";

  void ChangeSelected(index) {
    selectedIndex = index;
    notifyListeners();
  }

  void ChangeLangu(String Lang){
    language =Lang;
    notifyListeners();
  }


}
