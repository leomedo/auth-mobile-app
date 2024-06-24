import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/shared_widgets/my_form.dart';
import '../../../core/theme/my_colors.dart';
import '../logic/home_controller.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      if (homeController.userModel.email == null) {
        return const Center(
          child: CircularProgressIndicator(
            strokeWidth: 4,
            color: MyColors.myBlue,
          ),
        );
      } else {
        return Column(
          children: [
            Center(
                child: Text(
              '${homeController.userModel.firstName} ${homeController.userModel.lastName}',
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            )),
            const SizedBox(
              height: 30,
            ),
            MyForm(
                labelText: 'Username',
                style: const TextStyle(
                  color: MyColors.myBlack,
                ),
                enabled: false,
                initialValue:
                    '${homeController.userModel.firstName} ${homeController.userModel.lastName}'),
            MyForm(
              labelText: 'Email',
              style: const TextStyle(
                color: MyColors.myBlack,
              ),
              enabled: false,
              initialValue: homeController.userModel.email!,
            ),
            const MyForm(
                labelText: 'Gender',
                style: TextStyle(
                  color: MyColors.myBlack,
                ),
                enabled: false,
                initialValue: 'male'),
            const SizedBox(
              height: 30,
            ),
          ],
        );
      }
    });
  }
}
