import 'package:flutter/material.dart';

enum Page { recipe, ingredient, challenge, mypage }

class AppViewModel extends ChangeNotifier {
  int _index = 0;

  int get pageIndex => _index;

  void changeIndex(int index) {
    final Page page = Page.values[index];
    switch (page) {
      case Page.recipe:
      case Page.ingredient:
      case Page.challenge:
      case Page.mypage:
        _index = index;
        notifyListeners();
    }
  }
}
