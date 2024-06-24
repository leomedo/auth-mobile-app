
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/shared_widgets/my_button.dart';

import '../../../../core/theme/my_colors.dart';
import '../../logic/register_controller.dart';
import '../screens/login_screen.dart';

class RegisterBottom extends StatelessWidget {
  const RegisterBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            'Have a problem?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          GetBuilder<RegisterController>(builder: (registerController) {
            return MyButton(
              onPressed: () {
                registerController.register();
              },
              buttonColor: MyColors.myBlue,
              myChild: registerController.isLoaded
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: MyColors.myWhite),
                    ),
            );
          }),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text.rich(
              TextSpan(children: [
                const TextSpan(text: 'Already have an account? '),
                TextSpan(
                    text: 'login',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.off(const LoginScreen());
                      })
              ]),
            ),
          )
        ],
      ),
    );
  }
}
