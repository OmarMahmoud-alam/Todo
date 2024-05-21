import 'package:go_router/go_router.dart';
import 'package:todoapp/core/utils/route/route.dart';
import 'package:todoapp/core/utils/storage/shared_preference.dart';
import 'package:todoapp/feature/auth/data/models/user.dart';
import 'package:todoapp/feature/auth/data/repos/login_repo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/feature/auth/data/repos/refresh_token_repo.dart';
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
   UserModel? user;
  Future login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());

      final res =
          await loginRepo.login(emailController.text, passwordController.text);
      res.fold(
        (err) {
          showErrorSnackBar(context, err);

          emit(LoginFail());
        },
        (res) async {
          print(res.token);
          user = res;
          Preference.setString('userName', res.username);
          Preference.setString('token', res.token);
          context.go(AppRouter.home);
          emit(LoginSucceful());
        },
      );
    } else {
      emit(LoginInitial());
    }
  }

  Future<void> checkTokenToautologin(BuildContext context) async {
    var token = Preference.getString('token');
    if (token == null) {
      return;
    } else {
      final res = await RefreshTokenRepo.getrefreshtoken(
          emailController.text, passwordController.text);
      res.fold(
        (err) {
          showErrorSnackBar(context, err);

          emit(LoginFail());
        },
        (res) async {
          print(res.token);

          Preference.setString('userName', res.username);
          Preference.setString('token', res.token);

          emit(LoginSucceful());
        },
      );
    }
  }
}
