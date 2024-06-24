import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/shared_widgets/my_form.dart';
import '../../logic/login_controller.dart';

class LoginForms extends StatelessWidget {
  const LoginForms({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find();
    return Form(
      key: loginController.globalKey,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          GetBuilder<LoginController>(builder: (loginController) {
              return MyForm(
                labelText: 'Email',
                suffixIcon: loginController.isExistText? IconButton(
                  onPressed: () {
                    loginController.emailController.clear();
                    loginController.showAndHideCleatText('');
                  },
                  icon: const Icon(Icons.close_outlined),
                ): const SizedBox(),
                controller: loginController.emailController,
                validator: (String? value) {
                  return loginController.formValidation(value!);
                },
                onChanged: (p0) {
                  loginController.showAndHideCleatText(p0);
                  return null;
                },
              );
            }
          ),
          GetBuilder<LoginController>(builder: (loginController) {
            return MyForm(
              labelText: 'Password',
              showText: loginController.isPasswordHidden,
              suffixIcon: IconButton(
                onPressed: () {
                  loginController.showAndHidePassword();
                },
                icon: loginController.isPasswordHidden
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
              controller: loginController.passwordController,
              validator: (String? value) {
                return loginController.formValidation(value!);
              },
            );
          }),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
