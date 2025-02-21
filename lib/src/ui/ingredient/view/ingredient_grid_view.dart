import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/common/widgets/ingredient_tile.dart';
import 'package:yum_application/src/ui/ingredient/model/model.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/basic_ingredient_view_model.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/ingredient_view_model.dart';

/// 사용자의 재료 그리드 뷰
///
/// 전달된 아이템만큼 그리드를 생성합니다.
/// [IngredientTile]로 렌더링됩니다.
class IngredientGridView extends StatelessWidget {
  final List<BasicIngredient> ingredients;
  final String label;
  const IngredientGridView(
      {super.key, required this.ingredients, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            children: ingredients
                .map((i) => GestureDetector(
                      onTap: () {
                        /// 해당 재료를 선택할 경우,
                        /// [RefreginatorIngredientViewModel] 에서 해당 재료를 기본 재료로
                        /// 선택하게 됨.
                        context
                            .read<RefreginatorIngredientViewModel>()
                            .selectIngredient(i);

                        /// 이후 시트를 닫음.
                        Navigator.of(context).pop();
                      },
                      child: Consumer<BasicIngredientViewModel>(
                          builder: (context, provider, child) {
                        return IngredientTile(
                          ingredient: i,

                          /// 사용자의 즐겨찾기 유무를 토글링 하는 함수
                          ///
                          /// 즐겨찾기가 등록되면 아이콘이 활성화됨.
                          /// 탭을 통해서 즐겨찾기의 true false를 토글링.
                          onTap: () => provider.toggleIsFavorite(i.category),
                        );
                      }),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
