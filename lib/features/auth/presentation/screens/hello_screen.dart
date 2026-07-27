import 'package:blinkbuy/core/comman/widgets/custom_button.dart';
import 'package:blinkbuy/core/route/app_routes.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: .center,
          spacing: 20,
          children: [
            Image(
              image: AssetImage("assets/images/hello.png"),
              width: 343.w,
              height: 261.h,
            ),

            Image(
              image: AssetImage("assets/images/hello_word.png"),
              width: 147.w,
              height: 74.h,
            ),

            CustomButton(
              borderColor: Color(0xFFFF9900),
              backgroundColor: AppColors.primaryColor,
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.signUp);
              },
              text: "Sign up",
              width: double.infinity,
              height: 52.h,
              textAlign: TextAlign.center,
              textColor: Colors.white,
            ),

            CustomButton(
              borderColor: Color(0xFFFF9900),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.login);
              },
              text: "Sign In",
              textColor: Color(0xFFFF9900),
              width: double.infinity,
              height: 52.h,
              backgroundColor: AppColors.backgroundColor,
            ),
          ],
        ),
      ),
    );
  }
}
