import 'package:gap/gap.dart';
import 'package:todoapp/core/utils/assest_fonts_constant/app_assests.dart';
import 'package:todoapp/core/utils/assest_fonts_constant/app_fonts.dart';
import 'package:todoapp/feature/auth/presentation/autho/views/widgets/custombutton.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/feature/auth/presentation/autho/views_models/login_cubit/login_cubit.dart';

import 'custom_login_input_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.of(context);
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: LoginCubit.of(context).formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Image(
                    image: AssetImage(AppAssets.logo),
                    alignment: Alignment.center,
                  ),
                ),
                const Gap(
                  40,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomLoginInputForm(cubit: cubit),
                      SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            Checkbox(value: false, onChanged: (value) {}),
                            const Text('تذكرني',
                                style: FontStyles.textStyle14bl),
                            const Spacer(),
                          ],
                        ),
                      ),
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          return state is LoginLoading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Center(
                                  child: CustomAuthButton(
                                      text: 'تسجيل الدخول',
                                      onTap: () {
                                        LoginCubit.of(context).login(context);
                                      }),
                                );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
