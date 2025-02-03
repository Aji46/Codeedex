import 'package:codeedex/Constants/color.dart';
import 'package:codeedex/view/login/widgets/header.dart';
import 'package:codeedex/view/login/widgets/login_form.dart';
import 'package:codeedex/view/login/widgets/login_image.dart';
import 'package:codeedex/view/login/widgets/signup_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: const [
            HeaderText(),
            SizedBox(height: 20),
            LoginImage(),
            SizedBox(height: 30),
            LoginForm(),
      
      
            SizedBox(height: 20),
            SignUpText(),
          ],
        ),
      ),
    );
  }
}
