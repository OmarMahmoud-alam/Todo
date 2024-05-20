import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp/core/core_widget/custom_button.dart';
import 'package:todoapp/core/utils/assest_fonts_constant/app_assests.dart';

class Nointernetwidget extends StatelessWidget {
  const Nointernetwidget({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          AppAssets.nointernetanimation,
          width: 260,
        ),
        const Text(
          'لا يوجد اتصال بالانترنت',
          style: TextStyle(fontSize: 20),
        ),
        const Gap(10),
        Center(
          child: SizedBox(
            width: 340,
            child: customAuthButton(
              text: 'تحديث الصفحه',
              onTap: onPressed,
            ),
          ),
        )
      ],
    );
  }
}