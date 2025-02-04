import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/app/view/app.dart';
import 'package:yum_application/src/app/viewModel/app_view_model.dart';
import 'package:yum_application/src/challenge/view/challenge_completed_view.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppViewModel(),
      child: const ChallengeCompletedView(),
    );
  }
}
