import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../core/network/api_const.dart';
import '../../../core/network/api_functions.dart';
import '../../../main.dart';
import '../../home/home_screen.dart';

class LoginController extends GetxController {
  ApiFunctions apiFunctions = ApiFunctions();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
  bool isLoaded = false;
  bool isPasswordHidden = true;
  bool isExistText = false;
  bool rememberMe = false;

  checkRememberMe(bool value) {
    rememberMe = value;
    update();
  }

  showAndHidePassword() {
    isPasswordHidden = !isPasswordHidden;
    update();
  }


  showAndHideCleatText(text) {
    if (text == ''){
      isExistText = false;
    }else{
      isExistText = true;
    }
    update();
  }

  loading() {
    isLoaded = !isLoaded;
    update();
  }

  formValidation(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }
  }

  login() async {
    if (globalKey.currentState!.validate()) {
      loading();
      var response = await apiFunctions.postData(ApiConst.loginLink, {
        'email': emailController.text,
        'password': passwordController.text,
      });
      if (response['error'] ==
          'Note: Only defined users succeed registration') {
        loading();
        Get.defaultDialog(middleText: 'User not found');
      } else if (response['error'] == 'user not found') {
        loading();
        Get.defaultDialog(middleText: 'User not found');
      } else {
        if (rememberMe) sharedPreferences.setString('token', response['token']);
        loading();
        Get.off(const HomeScreen());
      }
    }
  }
}
