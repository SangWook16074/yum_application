import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/domain/app/view/app.dart';
import 'package:yum_application/src/domain/app/viewModel/app_view_model.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppViewModel(),
      child: const App(),
    );
  }
}
