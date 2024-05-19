
import 'package:todoapp/core/utils/assest_fonts_constant/app_assests.dart';
import 'package:todoapp/feature/auth/presentation/autho/views/login_view.dart';
import 'package:todoapp/feature/auth/presentation/autho/views/widgets/custominput.dart';

import 'package:todoapp/feature/auth/presentation/autho/views_models/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  @override
  void initState() {
    /* FirebaseMessaging.instance
        .getToken()
        .then((value) => CacheHelper.saveData(key: 'token', value: value))
        .toString();*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = RegisterCubit.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Image(
                  image: const AssetImage(AppAssets.moveright),
                  alignment: Alignment.center,
                  height: 105.h,
                  width: 267.w,
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'أهلا بك',
                            style: FontStyles.textStyle20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'سجل لدينا وتمتع بالمواد التدريبية المقدمة لك',
                            style: FontStyles.secondarytext14,
                          ),
                        ),
                      ),
                      30.0.ht,
                      Completeinput(
                        name: 'الاسم بالكامل',
                        child: customTextField(
                            prefix: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: SvgPicture.asset(AppAssets.fullname),
                            ),
                            hintText: 'ادخل اسمك الرباعي',
                            controller: cubit.nameController,
                            isPassword: false,
                            type: TextInputType.name),
                      ),

                      const SizedBox(
                        height: 16,
                      ),

                      Completeinput(
                        name: 'البريد الالكتروني',
                        child: customTextField(
                            hintText: 'ادخل البريد الالكتروني',
                            prefix: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: SvgPicture.asset(AppAssets.email),
                            ),
                            controller: cubit.emailController,
                            isPassword: false,
                            type: TextInputType.name),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Completeinput(
                        name: 'اسم المستخدم',
                        child: customTextField(
                            hintText: 'ادخل اسم المستخدم',
                            prefix: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: SvgPicture.asset(AppAssets.username),
                            ),
                            controller: cubit.usercnamecontroller,
                            isPassword: false,
                            type: TextInputType.name),
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      Completeinput(
                        name: 'رقم الجوال',
                        child: customTextField(
                          hintText: 'ادخل رقم جوالك',
                          prefix: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: SvgPicture.asset(AppAssets.mobile),
                          ),
                          type: TextInputType.phone,
                          onPressed: () {},
                          // endIcon: const Icon(Icons.phone),
                          controller: cubit.phoneNumberController,
                          isPassword: false,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      Completeinput(
                        name: 'كلمة المرور',
                        child: customTextField(
                            hintText: 'ادخل كلمة المرور الخاصة بك',
                            prefix: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: SvgPicture.asset(AppAssets.lock),
                            ),
                            controller: cubit.passwordController,
                            isPassword:
                                cubit.showPassword == true ? true : false,
                            type: TextInputType.visiblePassword,
                            onPressed: () {
                              setState(() {
                                cubit.showPassword = !cubit.showPassword;
                              });
                            },
                            endIcon: cubit.showPassword == true
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility)),
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      Completeinput(
                        name: 'تأكيد كلمة المرور',
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
                            /* SizedBox(
                              height: 10,
                              child: 
                              SvgPicture.asset(
                                AppAssets.lock,
                                height: 5,
                                width: 5,
                              ),
                            ),*/
                            controller: cubit.confirmPasswordController,
                            isPassword:
                                cubit.showConPassword == true ? true : false,
                            type: TextInputType.visiblePassword,
                            onPressed: () {
                              setState(() {
                                cubit.showConPassword = !cubit.showConPassword;
                              });
                            },
                            endIcon: cubit.showConPassword == true
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility)),
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      ///////////////////////
                      //if user ==student
                      if (widget.isstudent) ...[
                        Completeinput(
                            name: 'اسم مدرستك',
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey), // Add a border
                                borderRadius:
                                    BorderRadius.circular(8), // Rounded corners
                              ),
                              width: double.infinity,
                              height: 46,
                              child: DropdownButton<String>(
                                dropdownColor: Colors.grey.withOpacity(0.9),
                                value: cubit.shoolname ?? 'Option 1',
                                underline: const SizedBox(),
                                isExpanded:
                                    true, // Make the dropdown take full width

                                onChanged: (newValue) {
                                  setState(() {
                                    cubit.shoolname = newValue;
                                  });
                                },
                                items: <String>[
                                  'Option 1',
                                  'Option 2',
                                  'Option 3',
                                  'notinschool',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ))
                      ],
                      SizedBox(
                        height: 20.h,
                      ),
                      BlocBuilder<RegisterCubit, RegisterState>(
                        builder: (context, state) {
                          return state is RegisterLoading
                              ? const Center(child: CircularProgressIndicator()
                                  /* ProgressDialog(
                                      status: 'Registar you in...')*/
                                  )
                              : Center(
                                  child: customAuthButton(
                                      text: 'إنشاء حساب',
                                      onTap: () {
                                        // cubit.register();
                                        MagicRouter.navigateTo(
                                            const EmailVerfiyView());
                                      }
                                      // onTap: () => cubit.register()

                                      ),
                                );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'لديك حساب بالفعل؟',
                            style: FontStyles.textStyle11.copyWith(
                              color: const Color(0xFF222222),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                // MagicRouter.pop();

                                MagicRouter.navigateAndReplace(
                                    const LoginView());
                              },
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(50, 30),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  alignment: Alignment.centerLeft),
                              child: Text(
                                'تسجيل الدخول ',
                                style: FontStyles.textStyle11.copyWith(
                                  color: const Color(0xFF222222),
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
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
