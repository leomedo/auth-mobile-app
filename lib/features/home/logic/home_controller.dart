import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task_1/features/home/models/user_model.dart';


import '../../../core/network/api_const.dart';
import '../../../core/network/api_functions.dart';
import '../../../main.dart';
import '../../Auth/ui/screens/login_screen.dart';

class HomeController extends GetxController{
  ApiFunctions apiFunctions = ApiFunctions();
  UserModel userModel = UserModel();



  getUserInfo()async{
    var response = await apiFunctions.queryUser('${ApiConst.getUserLink}/${sharedPreferences.getInt('id')}');
    userModel = UserModel.fromJson(response['data']);
    update();
  }

  logout(){
    sharedPreferences.clear();
    Get.delete<HomeController>();
    Get.off(const LoginScreen());
  }

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }
}