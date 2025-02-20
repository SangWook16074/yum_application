import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/app/page/app_page.dart';
import 'package:yum_application/src/ui/app/config/app_config.dart';
import 'package:yum_application/src/ui/auth/page/login_page.dart';
import 'package:yum_application/src/ui/auth/view/login_view.dart';
import 'package:yum_application/src/ui/common/widgets/loading_progress_indicator.dart';
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
      home: const LoginPage(),
    );
  }
}
