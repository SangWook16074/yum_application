import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/common/enums/status.dart';
import 'package:yum_application/src/ui/common/widgets/loading_progress_indicator.dart';
import 'package:yum_application/src/ingredient/view/ingredient_add_view.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';
import 'package:yum_application/src/ingredient/widget/ingredient_filter_check_box.dart';

import 'package:yum_application/src/ingredient/widget/refreginator_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RefreginatorIngredientViewModel>(
        builder: (context, provider, child) {
      if (provider.status == Status.error) {
        return _error();
      }
      return Stack(
        children: [
          Scaffold(
            // floatingActionButton: _fab(),
            body: SafeArea(
              top: true,
              bottom: false,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _header(),
                    _toggleWarning(),
                    _freezer(),
                    _fridge(),
                  ],
                ),
              ),
            ),
          ),
          if (provider.status == Status.loading) ..._loading(),
        ],
      );
    });
  }

  Widget _header() {
    return Padding(
      key: const Key("header"),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 8.0),
      child: Builder(builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "나의 냉장고",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        );
      }),
    );
  }

  Widget _freezer() {
    return Padding(
      key: const Key("freezer"),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Consumer<RefreginatorIngredientViewModel>(
          builder: (context, provider, child) {
        return RefreginatorContainer(
            label: "냉동 보관", children: provider.myFreezedIngredients);
      }),
    );
  }

  Widget _fridge() {
    return Padding(
      key: const Key("fridge"),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Consumer<RefreginatorIngredientViewModel>(
          builder: (context, provider, child) {
        return RefreginatorContainer(
            label: "냉장 보관",
            rowCount: 3,
            children: provider.myUnfreezedIngredients);
      }),
    );
  }

  Widget _fab() => Builder(builder: (context) {
        return FloatingActionButton(
          key: const Key("fab"),
          foregroundColor: const Color(0xffffffff),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const IngredientAddView()));
          },
          child: const Icon(
            Icons.add,
            size: 32,
          ),
        );
      });

  List<Widget> _loading() => [
        ModalBarrier(
          color: Colors.white.withOpacity(0.2),
          dismissible: false,
        ),
        const Center(
          child: LoadingProgressIndicator(),
        )
      ];

  Widget _error() => const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("에러가 발생했습니다!"),
              )
            ],
          ),
        ),
      );

  Widget _toggleWarning() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Consumer<RefreginatorIngredientViewModel>(
                builder: (context, provider, child) {
              return IngredientFilterCheckBox(
                  value: provider.isWarningFilterOn,
                  label: "기간 임박",
                  onChanged: provider.toggleWarning);
            })
          ],
        ),
      );
}
