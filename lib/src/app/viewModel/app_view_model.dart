import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:yum_application/src/common/widgets/image_widget.dart';
import 'package:yum_application/src/ingredient/view/ingredient_add_view.dart';
import 'package:yum_application/src/recipe/view/recipe_%20register_view.dart';
import 'package:yum_application/src/util/global_variable.dart';

enum Page { ingredient, recipe, challenge, mypage }

class AppViewModel extends ChangeNotifier {
  int _index = 0;

  int get pageIndex => _index;

  Page get currPage => Page.values[_index];

  String get fabImage {
    switch (currPage) {
      case Page.ingredient:
        return ImagePath.fabAdd;
      case Page.recipe:
        return ImagePath.fabWrite;
      default:
        return "";
    }
  }

  void changeIndex(int index) {
    final Page page = Page.values[index];
    switch (page) {
      case Page.ingredient:
      case Page.recipe:
      case Page.challenge:
      case Page.mypage:
        _index = index;
        notifyListeners();
    }
  }

  /// 현재의 페이지 뷰에 따라서
  /// Fab의 이동 경로를 변경하는 메소드
  void routeTo() {
    final Page page = Page.values[_index];
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final context = GlobalVariable.naviagatorState.currentContext!;
      switch (page) {
        case Page.ingredient:
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const IngredientAddView()));
        case Page.recipe:
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const RecipeRegisterView()));
        default:
          return;
      }
    });
  }
}
