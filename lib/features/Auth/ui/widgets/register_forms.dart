import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/shared_widgets/my_form.dart';
import '../../logic/register_controller.dart';

class RegisterForms extends StatelessWidget {
  const RegisterForms({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        GetBuilder<RegisterController>(builder: (registerController) {
          return MyForm(
            labelText: 'Username',
            suffixIcon: registerController.isExistTextUser
                ? IconButton(
                    onPressed: () {
                      registerController.usernameController.clear();
                      registerController.showAndHideCleatTextUser('');
                    },
                    icon: const Icon(Icons.close_outlined),
                  )
                : const SizedBox(),
            controller: registerController.usernameController,
            validator: (String? value) {
              return registerController.formValidation(value!);
            },
            onChanged: (p0) {
              registerController.showAndHideCleatTextUser(p0);
              return null;
            },
          );
        }),
        GetBuilder<RegisterController>(builder: (registerController) {
          return MyForm(
            labelText: 'Email',
            suffixIcon: registerController.isExistTextEmail
                ? IconButton(
                    onPressed: () {
                      registerController.emailController.clear();
                      registerController.showAndHideCleatTextEmail('');
                    },
                    icon: const Icon(Icons.close_outlined),
                  )
                : const SizedBox(),
            controller: registerController.emailController,
            validator: (String? value) {
              return registerController.formValidation(value!);
            },
            onChanged: (p0) {
              registerController.showAndHideCleatTextEmail(p0);
              return null;
            },
          );
        }),
        GetBuilder<RegisterController>(builder: (registerController) {
          return MyForm(
              labelText: 'Password',
              showText: registerController.isPasswordHidden,
              suffixIcon: IconButton(
                onPressed: () {
                  registerController.showAndHidePassword();
                },
                icon: registerController.isPasswordHidden
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
              controller: registerController.passwordController,
              validator: (String? value) {
                return registerController.formValidation(value!);
              });
        }),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
