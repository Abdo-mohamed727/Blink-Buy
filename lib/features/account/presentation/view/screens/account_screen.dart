import 'package:blinkbuy/core/comman/widgets/coustom_text_form_field.dart';
import 'package:blinkbuy/core/comman/widgets/custom_button.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/core/theme/styels.dart';
import 'package:blinkbuy/features/account/presentation/view/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();

    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 102.h),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.charcoal,
                  radius: 50,
                  child: Icon(Icons.person, color: AppColors.white),
                ),
                Positioned(
                  bottom: 5,
                  right: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.camera_alt_outlined, size: 24.sp),
                  ),
                ),
              ],
            ),
            SizedBox(height: 77.h),
            ProfileViewBody(
              nameController: nameController,
              emailController: emailController,
              passwordController: passwordController,
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
      ),
    );
  }
}
