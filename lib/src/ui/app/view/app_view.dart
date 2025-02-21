import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/app/viewModel/app_view_model.dart';
import 'package:yum_application/src/ui/challenge/view/challenge_view.dart';
import 'package:yum_application/src/ui/common/widgets/image_widget.dart';
import 'package:yum_application/src/ui/ingredient/view/home_view.dart';
import 'package:yum_application/src/ui/recipe/view/recipe_view.dart';
import 'package:yum_application/src/ui/user/view/mypage_view.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: _bottomNav(),
      floatingActionButton: _fab(),
    );
  }

  Widget _body() => Consumer<AppViewModel>(builder: (context, provider, child) {
        return IndexedStack(
          key: const Key("app view body"),
          index: provider.pageIndex,
          children: const [
            HomeView(
              key: Key("app view ingredient view"),
            ),
            RecipeView(
              key: Key("app view recipe view"),
            ),
            ChallengeView(
              key: Key("app view challenge view"),
            ),
            MyPageView(
              key: Key("app view mypage view"),
            ),
          ],
        );
      });

  Widget _bottomNav() =>
      Consumer<AppViewModel>(builder: (context, provider, child) {
        return BottomNavigationBar(
            key: const Key("app view bottom nav"),
            type: BottomNavigationBarType.fixed,
            onTap: provider.changeIndex,
            currentIndex: provider.pageIndex,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            items: [
              BottomNavigationBarItem(
                  key: const Key("bottom nav ingredient"),
                  icon: ImageWidget(path: ImagePath.ingredientOff, width: 100),
                  activeIcon:
                      ImageWidget(path: ImagePath.ingredientOn, width: 100),
                  label: "나의 냉장고"),
              BottomNavigationBarItem(
                  key: const Key("bottom nav recipe"),
                  icon: ImageWidget(
                    path: ImagePath.recipeOff,
                    width: 100,
                  ),
                  activeIcon: ImageWidget(path: ImagePath.recipeOn, width: 100),
                  label: "레시피"),
              BottomNavigationBarItem(
                  key: const Key("bottom nav challenge"),
                  icon: ImageWidget(path: ImagePath.challengeOff, width: 100),
                  activeIcon:
                      ImageWidget(path: ImagePath.challengeOn, width: 100),
                  label: "챌린지"),
              BottomNavigationBarItem(
                  key: const Key("bottom nav mypage"),
                  icon: ImageWidget(path: ImagePath.mypageOff, width: 100),
                  activeIcon: ImageWidget(path: ImagePath.mypageOn, width: 100),
                  label: "마이 페이지"),
            ]);
      });

  Widget _fab() => Consumer<AppViewModel>(builder: (context, provider, child) {
        if (provider.pageIndex < 2) {
          return FloatingActionButton(
              key: const Key("fab"),
              foregroundColor: const Color(0xffffffff),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              onPressed: provider.routeTo,
              child: ImageWidget(
                path: provider.fabImage,
                width: 90,
              ));
        } else {
          return Container();
        }
      });
}
