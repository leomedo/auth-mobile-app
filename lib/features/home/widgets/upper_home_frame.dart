import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/my_colors.dart';
import '../logic/home_controller.dart';

class UpperHomeFrame extends StatelessWidget {
  const UpperHomeFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      child: GetBuilder<HomeController>(builder: (homeController){
        if(homeController.userModel.avatar == null){
          return const Center(child: CircularProgressIndicator(color: MyColors.myBlue,strokeWidth: 4,));
        }else{
          return Stack(
            alignment: FractionalOffset.bottomCenter,
            children: [
              Positioned(
                  top: 0,
                  child: Image.asset('images/auth_frame_top.png')),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                  child: Image.network(homeController.userModel.avatar!))
            ],
          );
        }
      },)
    );
  }
}
