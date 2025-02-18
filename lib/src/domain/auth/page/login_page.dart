import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/auth/view/login_view.dart';
import 'package:yum_application/src/domain/auth/viewModel/login_view_model.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: const LoginView(),
    );
  }
}
