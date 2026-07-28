import 'package:blinkbuy/core/comman/widgets/coustom_text_form_field.dart';
import 'package:blinkbuy/core/comman/widgets/custom_button.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/core/theme/styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Name", style: AppTextStyles.font18Regular),
          CustomTextField(
            controller: nameController,
            hintText: "Name",
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your name";
              }
              return null;
            },
          ),
          SizedBox(height: 25.h),
          Text("Email", style: AppTextStyles.font18Regular),
          CustomTextField(
            controller: emailController,
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your email";
              }
              return null;
            },
          ),
          SizedBox(height: 25.h),
          Text("Password", style: AppTextStyles.font18Regular),
          CustomTextField(
            controller: passwordController,
            hintText: "Password",
            keyboardType: TextInputType.text,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your password";
              }
              return null;
            },
          ),
          SizedBox(height: 115.h),
          CustomButton(
            backgroundColor: AppColors.orangeLight,
            onPressed: () {},
            text: 'Sumbit',
            textStyle: AppTextStyles.font16Medium.copyWith(
              color: AppColors.white,
            ),
            width: double.infinity,
            height: 48.h,
          ),
        ],
      ),
    );
  }
}
