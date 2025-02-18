import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/app/page/app_page.dart';
import 'package:yum_application/src/app/config/app_config.dart';
import 'package:yum_application/src/challenge/widget/challenge_completed_food.dart';
import 'package:yum_application/src/util/app_theme.dart';
import 'package:yum_application/src/util/global_variable.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  final providers = getInitProvider();
  runApp(MultiProvider(
    providers: providers,
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: GlobalVariable.naviagatorState,
        theme: light,
        home: const ChallengeCompletedFood(
          title: '부대찌개 완성!',
          imagePath: 'assets/images/beef.png',
          label: '레시피 등록 챌린지를 마스터 헀어요',
        ));
  }
}
