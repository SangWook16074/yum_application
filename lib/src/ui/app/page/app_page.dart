import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/app/view/view.dart';
import 'package:yum_application/src/ui/app/viewModel/app_view_model.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppViewModel>(
      create: (context) => AppViewModel(),
      child: const AppView(),
    );
  }
}
