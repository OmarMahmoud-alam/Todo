//import 'package:todoapp/feature/auth/presentation/views_models/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/feature/auth/presentation/autho/views/widgets/register_view_body.dart';
import 'package:todoapp/feature/auth/presentation/autho/views_models/register_cubit/register_cubit.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key, required this.isstudent}) : super(key: key);
  final bool isstudent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: BlocProvider(
      create: (context) => RegisterCubit(),
      child: RegisterViewBody(
      ),
    )));
  }
}
