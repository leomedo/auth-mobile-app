import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../logic/login_controller.dart';
import '../widgets/login_bottom.dart';
import '../widgets/login_forms.dart';
import '../widgets/upper_auth_frame.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    Get.put(LoginController());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<LoginController>();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: ListView(
          children: const [
            UpperAuthFrame(),
            SizedBox(height: 30,),
            Center(child: Text('Login in to your account',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),)),
            LoginForms(),
            LoginBottom()
          ],
        ),
    );
  }
}
