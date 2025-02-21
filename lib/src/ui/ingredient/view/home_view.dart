import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/common/enums/status.dart';
import 'package:yum_application/src/ui/common/widgets/loading_progress_indicator.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/ingredient_view_model.dart';
import 'package:yum_application/src/ui/ingredient/widget/ingredient_filter_check_box.dart';
import 'package:yum_application/src/ui/ingredient/widget/refreginator_container.dart';

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
            body: SafeArea(
              top: true,
              bottom: false,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // 헤더 영역
                    _header(),
                    // 기간임박 필터 토글 버튼
                    _toggleWarning(),
                    // 냉동칸
                    _freezer(),
                    // 냉장칸
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

  /// 헤더 영역입니다.
  ///
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

  /// 냉동칸 영역입니다.
  ///
  /// 사용자의 냉동칸에 해당하는 [RefreginatorIngredient]를 보여줍니다.
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

  /// 냉장칸 영역입니다.
  ///
  /// 사용자의 냉장칸에 해당하는 [RefreginatorIngredient]를 보여줍니다.
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

  List<Widget> _loading() => [
        ModalBarrier(
          color: Colors.white.withOpacity(0.2),
          dismissible: false,
        ),
        const Center(
          child: LoadingProgressIndicator(),
        )
      ];

  /// 에러 위젯
  ///
  /// 데이터 통신 간 에러가 발생하면
  /// 해당 위젯이 렌더링 됩니다.
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

  /// 기간임박 필터 토글 영역
  ///
  /// 사용자의 재료 중 유통기한이 3일 이내로 임박한 [RefreginatorIngredient]를
  /// 필터링 합니다.
  /// On인 경우 필터링이 켜집니다.
  /// Off인 경우 필터링이 해제됩니다.
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
