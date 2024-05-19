import 'dart:io';
;
import 'package:flutter_svg/svg.dart';
import 'package:todoapp/core/utils/assest_fonts_constant/app_assests.dart';
import 'package:todoapp/core/utils/assest_fonts_constant/const_color.dart';
import 'package:todoapp/feature/auth/presentation/autho/views/widgets/custom_text_form.dart';
import 'package:todoapp/feature/auth/presentation/autho/views/widgets/custominput.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/feature/auth/presentation/autho/views_models/login_cubit/login_cubit.dart';


class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: LoginCubit.of(context).formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
             
                  Center(
                    child: Image(
                      image: const AssetImage(AppAssets.logo),
                      alignment: Alignment.center,
                     
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Completeinput(
                          name: 'البريد الالكتروني',
                          isrequired: false,
                          child: customTextField(
                              hintText: 'ادخل البريد الالكتروني',
                              prefix: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: SvgPicture.asset(AppAssets.email),
                              ),
                              controller:
                                  LoginCubit.of(context).emailController,
                              isPassword: false,
                              type: TextInputType.name),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Completeinput(
                          name: ' كلمة المرور',
                          child: customTextField(
                              hintText: 'ادخل كلمة المرور الخاصة بك',
                              prefix: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(
                                  AppAssets.lock,
                                  // width: 24,
                                  // height: 24,
                                ),
                              ),
                              controller:
                                  LoginCubit.of(context).passwordController,
                              isPassword: cubit.showPassword,
                              type: TextInputType.visiblePassword,
                              onPressed: () {
                                setState(() {
                                  cubit.showPassword = !cubit.showPassword;
                                });
                              },
                              endIcon: cubit.showPassword
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility)),
                        ),
                        SizedBox(
                          height: 40,
                          child: Row(
                            children: [
                              Checkbox(value: false, onChanged: (value) {}),
                              const Text('تذكرني',
                                  style: FontStyles.textStyle14bl),
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  MagicRouter.navigateTo(
                                      const ForgetPassView());
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  //minimumSize: const Size(50, 30),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text('نسيت كلمة السر ؟',
                                    style: FontStyles.textStyle11.copyWith(
                                      color: const Color(0xFF222222),
                                      fontWeight: FontWeight.w400,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            return state is LoginLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                    /* ProgressDialog(
                                        status: LocaleKeys.loggingYouIn.tr()),*/
                                  )
                                : Center(
                                    child: customAuthButton(
                                        text: 'تسجيل الدخول',
                                        onTap: () {
                                          LoginCubit.of(context).login();
                                        }),
                                  );
                          },
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ليس لديك حساب؟',
                              style: FontStyles.textStyle11.copyWith(
                                color: const Color(0xFF222222),
                              ),
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: const Size(50, 30),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    alignment: Alignment.centerLeft),
                                onPressed: () {
                                  MagicRouter.navigateAndPopAll(
                                      const SelectUserRole());
                                  // MagicRouter.navigateTo(const RegisterView(isstudent: null,));
                                },
                                child: Text(
                                  ' إنشاء حساب ',
                                  style: FontStyles.textStyle11.copyWith(
                                    color: const Color(0xFF222222),
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const OrDivider(),
                        //   Platform.isAndroid ? const OrDivider() : Container(),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Sociallogin(
                              image: AppAssets.google,
                              name: 'جوجل',
                              //   imgColor: Colors.white,
                              //   buttonColor: Colors.blueAccent,
                              onTap: () {},
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Sociallogin(
                              image: AppAssets.twitter,
                              name: 'تويتر',
                              //   imgColor: Colors.white,
                              //   buttonColor: Colors.blueAccent,
                              onTap: () {},
                            ),
                            /*   SocialButton(
                                    img: AppAssets.googleIcon,
                                    imgColor: Colors.white,
                                    buttonColor:
                                        Colors.redAccent.withOpacity(0.9),
                                    onPress: () {},
                                  ),*/
                          ],
                        ),

                        SizedBox(
                          height: 30.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ShowSnackBar extends StatelessWidget {
  const ShowSnackBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      backgroundColor: kDeepBlue,
      content: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
