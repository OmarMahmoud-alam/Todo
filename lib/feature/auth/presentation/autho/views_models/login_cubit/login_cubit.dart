import 'dart:developer';


import 'package:todoapp/feature/auth/data/repos/login_repo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/feature/auth/presentation/autho/views/widgets/custom_snackbar.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final loginRepo = LoginRepo();
  static LoginCubit of(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showPassword = true;
  bool localeIsEn = true;

  Future login() async {
    /*   var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.mobile &&
        connectivityResult != ConnectivityResult.wifi) {
      showSnackBar(
        LocaleKeys.noInternetConnectivity.tr(),
      );
    }*/

    if (emailController.text.length < 10) {
      showUppearSnackBar2(
          'error the  email must be at 10 characters long at least ',
          //width: 200, //must be at  characters long ',
          // LocaleKeys.pleaseProvideAValidEmailAddress.tr(),

          color: Colors.red);
      return;
    }

    if (passwordController.text.length < 8) {
      showUppearSnackBar2(
          'Password is Wrong'
          //  LocaleKeys.pleaseProvideAValidPasswordShouldGreaterThan8Character.tr(),
          ,
          color: Colors.red);
      return;
    }
    emit(LoginLoading());
    MagicRouter.navigateAndPopAll(const BottomNavScreen());

    emit(LoginInitial());


  }
}
