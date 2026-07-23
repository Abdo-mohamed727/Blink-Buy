import 'package:blinkbuy/core/comman/widgets/custom_button.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HelloScreen extends StatefulWidget {
  const HelloScreen({super.key});

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: .center,
          spacing: 20,
          children: [
            Image(
              image: AssetImage("assets/images/hello.png"),
              width: 343,
              height: 261,
            ),

            Image(
              image: AssetImage("assets/images/hello_word.png"),
              width: 147,
              height: 74,
            ),

            CustomButton(
              borderColor: Color(0xFFFF9900),
              backgroundColor: AppColors.primaryColor,
              onPressed: () {}, //!navigate to sign up
              text: "Sign up",
              width: double.infinity,
              height: 52,
              textAlign: TextAlign.center,
              textColor: Colors.white,
            ),

            CustomButton(
              borderColor: Color(0xFFFF9900),
              onPressed: () {}, //!navigate to sign in
              text: "Sign In",
              textColor: Color(0xFFFF9900),
              width: double.infinity,
              height: 52,
              backgroundColor: AppColors.backgroundColor,
            ),
          ],
        ),
      ),
    );
  }
}
