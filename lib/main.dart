import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/app/page/app_page.dart';
import 'package:yum_application/src/app/config/app_config.dart';
import 'package:yum_application/src/ingredient/view/home_view.dart';
import 'package:yum_application/src/recipe/view/review_view.dart';
import 'package:yum_application/src/recipe/view/review_write_view.dart';
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
      home: const ReviewWriteView(),
    );
  }
}
