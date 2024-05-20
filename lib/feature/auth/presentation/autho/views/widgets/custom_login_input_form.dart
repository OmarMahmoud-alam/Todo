import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todoapp/core/extension/extensions_export.dart';
import 'package:todoapp/core/utils/assest_fonts_constant/app_assests.dart';
import 'package:todoapp/feature/auth/presentation/autho/views/widgets/custom_text_form.dart';
import 'package:todoapp/feature/auth/presentation/autho/views/widgets/custominput.dart';
import 'package:todoapp/feature/auth/presentation/autho/views_models/login_cubit/login_cubit.dart';

class CustomLoginInputForm extends StatefulWidget {
  const CustomLoginInputForm({
    super.key,
    required this.cubit,
  });

  final LoginCubit cubit;

  @override
  State<CustomLoginInputForm> createState() => _CustomLoginInputFormState();
}

class _CustomLoginInputFormState extends State<CustomLoginInputForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Completeinput(
          name: ' username',
          isrequired: true,
          child: customTextField(
              validate: (inputext) {
                if (inputext!.length < 3) {
                  return 'username is not in write formual ';
                } else {
                  return null;
                }
              },
              hintText: ' Enter username ',
              prefix: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: SvgPicture.asset(AppAssets.email),
              ),
              controller: widget.cubit.emailController,
              isPassword: false,
              type: TextInputType.name),
        ),
        const SizedBox(
          height: 16,
        ),
        Completeinput(
          name: '  password',
          child: customTextField(
              validate: (inputext) {
                if (inputext!.length < 3) {
                  return 'password must be 3 character at least  ';
                } else {
                  return null;
                }
              },
              hintText: 'Enter your password',
              prefix: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  AppAssets.lock,
                  // width: 24,
                  // height: 24,
                ),
              ),
              controller: widget.cubit.passwordController,
              isPassword: widget.cubit.showPassword,
              type: TextInputType.visiblePassword,
              onPressed: () {
                setState(() {
                  widget.cubit.showPassword = !widget.cubit.showPassword;
                });
              },
              endIcon: widget.cubit.showPassword
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility)),
        ),
      ],
    );
  }
}
