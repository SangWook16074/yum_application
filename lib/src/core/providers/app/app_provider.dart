import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/core/providers/common/client_provider.dart';
import 'package:yum_application/src/core/providers/ingredient/basic_ingredient_view_model_provider.dart';
import 'package:yum_application/src/core/providers/ingredient/ingredient_repository_provider.dart';
import 'package:yum_application/src/core/providers/ingredient/ingredient_view_model_provider.dart';

/// 앱의 최상단에서 주입될 Provider를 관리하면 [AppProvider]
///
/// [Ingredient], [Recipe]는 앱의 최상단에서 Provider를 주입받습니다.
/// 추후에 더 추가될 경우 [AppProvider]에서 추가할 수 있습니다.
class AppProvider extends StatelessWidget {
  final Widget child;
  const AppProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /// HTTP 통신 관련 초기 주입
        clientProvider,

        /// [Ingredient]관련 레포지토리 초기 주입
        ...ingredientRepositoryProvider,

        /// [Ingredient]관련 뷰모델 초기 주입
        ingredientViewModelProvider,
        baiscIngredientViewModelProvider,
      ],
      child: child,
    );
  }
}
