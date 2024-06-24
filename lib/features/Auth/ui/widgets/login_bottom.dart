
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/shared_widgets/my_button.dart';
import '../../../../core/theme/my_colors.dart';
import '../../logic/login_controller.dart';
import '../screens/register_screen.dart';

class LoginBottom extends StatelessWidget {
  const LoginBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GetBuilder<LoginController>(builder: (loginController){
                return Row(
                  children: [
                    Checkbox(
                      activeColor: MyColors.myBlue,
                        value: loginController.rememberMe,
                        onChanged: (value){
                          loginController.checkRememberMe(value!);
                        }
                    ),
                    const Text('Remember me', style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                );
              }),
              const Text(
                'Forget password?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          GetBuilder<LoginController>(builder: (loginController) {
            return MyButton(
              onPressed: () {
                loginController.login();
              },
              buttonColor: MyColors.myBlue,
              myChild: loginController.isLoaded
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text(
                      'login',
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
          Text.rich(
            TextSpan(children: [
              const TextSpan(text: 'Don’t have an account? '),
              TextSpan(
                  text: 'Register',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.off(const RegisterScreen());
                    })
            ]),
          )
        ],
      ),
    );
  }
}
