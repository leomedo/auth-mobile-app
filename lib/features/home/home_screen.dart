import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_1/features/home/widgets/upper_home_frame.dart';
import 'package:task_1/features/home/widgets/user_details.dart';

import '../../core/shared_widgets/my_button.dart';

import '../../core/theme/my_colors.dart';
import 'logic/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      body: Column(
        children: [
          const UpperHomeFrame(),
          const SizedBox(height: 10,),
          const UserDetails(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: MyButton(onPressed: (){
              homeController.logout();
            }, buttonColor: MyColors.myRed, myChild: const Text('Log out', style: TextStyle(color: MyColors.myWhite),)),
          )


        ],
      )
    );
  }
}
