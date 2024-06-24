import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../core/network/api_const.dart';
import '../../../core/network/api_functions.dart';
import '../../../main.dart';
import '../ui/screens/login_screen.dart';

class RegisterController extends GetxController {
  ApiFunctions apiFunctions = ApiFunctions();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();

  bool isLoaded = false;
  bool isPasswordHidden = true;
  bool isExistTextUser = false;
  bool isExistTextEmail = false;

  showAndHidePassword() {
    isPasswordHidden = !isPasswordHidden;
    update();
  }

  loading() {
    isLoaded = !isLoaded;
    update();
  }

  showAndHideCleatTextUser(text) {
    if (text == ''){
      isExistTextUser = false;
    }else{
      isExistTextUser = true;
    }
    update();
  }

  showAndHideCleatTextEmail(text) {
    if (text == ''){
      isExistTextEmail = false;
    }else{
      isExistTextEmail = true;
    }
    update();
  }

  formValidation(String value) {
    if (value.isEmpty) {
      return 'Please fill this form';
    }
  }

  register() async {
    if (globalKey.currentState!.validate()) {
      loading();
      var response = await apiFunctions.postData(ApiConst.registerLink, {
        'email': emailController.text,
        'password': passwordController.text,
      });
      if (kDebugMode) {
        print(response);
      }
      if (response['error'] ==
          'Note: Only defined users succeed registration') {
        loading();
        Get.defaultDialog(
            middleText: 'Only defined users succeed registration');
      } else {
        loading();
        sharedPreferences.setInt('id', response['id']);
        Get.off(const LoginScreen());

      }
    }
  }
}
