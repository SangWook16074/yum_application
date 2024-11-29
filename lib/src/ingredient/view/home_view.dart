import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/data/ingredient/model/ingredient.dart';
import 'package:yum_application/src/ingredient/view/ingredient_add_view.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';

import 'package:yum_application/src/ingredient/widget/refreginator_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _fab(),
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _header(),
            _freezer(),
            _fridge(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 8.0),
      child: Builder(builder: (context) {
        return Row(
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
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Consumer<IngredientViewModel>(builder: (context, provider, child) {
        return RefreginatorContainer(
            label: "냉동 보관", children: provider.myFreezedIngredients);
      }),
    );
  }

  Widget _fridge() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Consumer<IngredientViewModel>(builder: (context, provider, child) {
        return RefreginatorContainer(
            label: "냉장 보관",
            rowCount: 3,
            children: provider.myUnfreezedIngredients);
      }),
    );
  }

  Widget _fab() => Builder(builder: (context) {
        return FloatingActionButton(
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
}
