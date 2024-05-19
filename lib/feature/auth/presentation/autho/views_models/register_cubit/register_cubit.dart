import 'dart:developer';
import 'package:todoapp/core/utils/app_storage.dart';
import 'package:todoapp/core/utils/magic_router.dart';
import 'package:todoapp/core/widgets/custom_snackbar.dart';
import 'package:todoapp/feature/auth/data/repos/phone_auth_repo.dart';
import 'package:todoapp/feature/auth/data/repos/register_repo.dart';
import 'package:todoapp/feature/auth/presentation/autho/views/done_registe.dart';
import 'package:todoapp/feature/bottomNav/presentation/screens/bottom_nav_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/otp_field.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit of(context) => BlocProvider.of(context);
  bool showPassword = true;
  bool showConPassword = true;
  String? shoolname = "notinschool";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usercnamecontroller = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final phoneNumberController = TextEditingController();
  var receivedID = '';
  final registerRepo = RegisterRepo();

//[age otp]
  OtpFieldController? otpController1;
  String otpcode = "";
  bool otpwrong = false;
  bool otpLengthis4 = false;


  Future register() async {
    if (passwordController.text.length < 8) {
      showUppearSnackBar(
        "The password length must be  at least 8 characters",

        // LocaleKeys.pleaseProvideAValidPasswordShouldGreaterThan8Character.tr(),
      );
      return;
    }
    if (phoneNumberController.text.length < 10) {
      showUppearSnackBar2("The phone  number should be at least 10 digits"
          // LocaleKeys.pleaseProvideAValidPhoneNumber.tr(),
          );
      return;
    }
    if (passwordController.text != confirmPasswordController.text) {
      showUppearSnackBar2(
          "The password  and the confirmation password do not match."

          //  LocaleKeys.PleaseEnterASimilarPassword.tr(),
          );
      return;
    }
    emit(RegisterLoading());
    final res = await registerRepo.register(
        conPassword: confirmPasswordController.text,
        password: passwordController.text,
        name: nameController.text,
        phone: phoneNumberController.text,
        email: emailController.text,
        schoolname: shoolname);
/*
    res.fold(
      (err) {
        showSnackBar(err);
        log(err.toString());
        emit(RegisterError());
      },
      (res) async {
        emit(RegisterLoaded());
        /*  showSnackBar(CacheHelper.getData(key: 'lang') != 'en'
            ? res.message
            : 'Logged in successfully');*/
        // showSnackBar(res.message);
        // log(res.message);

        // MagicRouter.navigateTo(const AfterSplashView());
        // submitPhoneNumber();
      },
    );*/
  }

  void VerfiyCodebody() async {
    emit(CheckOtpstate());
    if (!otpLengthis4) {
      showDialog(
          context: MagicRouter.currentContext!,
          builder: (BuildContext context) => const AlertDialog(
              title: Text("خطأ",
                  style: TextStyle(fontFamily: "Change"),
                  textAlign: TextAlign.center),
              content: Text('رمز التحقق غير  صحيح')));
    } else if (otpcode == "3456") {
      otpwrong = true;
      emit(Checkotpfail());
    } else {
      emit(CheckOtpdone());

      MagicRouter.navigateAndReplace(const DoneRegiste());
    } /*else {
      final res = await PhoneAuthRepo.phoneAuth(emailController.text, otpcode);
      res.fold(
        (err) {
          showUppearSnackBar2(
              AppStorage.getLang == 'en'
                  ? err
                  : 'Please check your data again, you have an error in the data',
              color: Colors.red);
          emit(CheckOtpstate());
        },
        (res) async {
          emit(CheckOtpdone());
          /*     await CacheHelper.saveData(key: 'userId', value: res.data.id);
        await CacheHelper.saveData(key: 'userName', value: res.data.name);
        await CacheHelper.saveData(key: 'photo', value: res.data.photo);
        await CacheHelper.saveData(key: 'phone', value: res.data.phone);
        await CacheHelper.saveData(key: 'login', value: true);
        print('-----------------');
        print(CacheHelper.getData(key: 'userId'));
        print(CacheHelper.getData(key: 'userName'));
        log('token ========== ${CacheHelper.getData(key: 'token')}');
        print('-----------------');*/
          MagicRouter.navigateAndPopAll(const BottomNavScreen());
        },
      );
    }*/
  }
}
