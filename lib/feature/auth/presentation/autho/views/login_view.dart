import 'package:todoapp/feature/auth/presentation/autho/views/widgets/login_view_body.dart';
import 'package:todoapp/feature/auth/presentation/autho/views_models/login_cubit/login_cubit.dart';

//import 'package:todoapp/feature/auth/presentation/views_models/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: LoginViewBody(),
    ));
  }
}
