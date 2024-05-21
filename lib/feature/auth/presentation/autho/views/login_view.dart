import 'package:go_router/go_router.dart';
import 'package:todoapp/core/utils/route/route.dart';
import 'package:todoapp/feature/auth/presentation/autho/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () => context.go(AppRouter.home),
                child: Text('Skip'))
          ],
        ),
        body: SafeArea(
          child: LoginViewBody(),
        ));
  }
}
