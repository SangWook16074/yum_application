import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/app/viewModel/app_view_model.dart';
import 'package:yum_application/src/common/image_widget.dart';
import 'package:yum_application/src/ingredient/view/home_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: _bottomNav(),
    );
  }

  Widget _body() => Consumer<AppViewModel>(builder: (context, provider, child) {
        return IndexedStack(
          index: provider.pageIndex,
          children: [
            Container(),
            const HomeView(),
            Container(),
            Container(),
          ],
        );
      });

  Widget _bottomNav() =>
      Consumer<AppViewModel>(builder: (context, provider, child) {
        return BottomNavigationBar(
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
                  icon: ImageWidget(
                    path: ImagePath.recipeOff,
                    width: 100,
                  ),
                  activeIcon: ImageWidget(path: ImagePath.recipeOn, width: 100),
                  label: "레시피"),
              BottomNavigationBarItem(
                  icon: ImageWidget(path: ImagePath.ingredientOff, width: 100),
                  activeIcon:
                      ImageWidget(path: ImagePath.ingredientOn, width: 100),
                  label: "나의 냉장고"),
              BottomNavigationBarItem(
                  icon: ImageWidget(path: ImagePath.challengeOff, width: 100),
                  activeIcon:
                      ImageWidget(path: ImagePath.challengeOn, width: 100),
                  label: "챌린지"),
              BottomNavigationBarItem(
                  icon: ImageWidget(path: ImagePath.mypageOff, width: 100),
                  activeIcon: ImageWidget(path: ImagePath.mypageOn, width: 100),
                  label: "마이 페이지"),
            ]);
      });
}
