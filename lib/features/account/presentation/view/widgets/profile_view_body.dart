import 'dart:io';

import 'package:blinkbuy/core/comman/widgets/coustom_text_form_field.dart';
import 'package:blinkbuy/core/comman/widgets/custom_button.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/core/theme/styels.dart';
import 'package:blinkbuy/features/account/presentation/view_model/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileError) {
            return Center(child: Text(state.messageError));
          }
          if (state is ProfileSuccess) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name", style: AppTextStyles.font18Regular),
                CustomTextField(
                  controller: profileCubit.nameController,
                  hintText: state.userEntity.message.name,
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
                  controller: profileCubit.emailController,
                  hintText: state.userEntity.message.email,
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
                  controller: profileCubit.passwordController,
                  hintText: "...............",
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 105.h),

                CustomButton(
                  backgroundColor: AppColors.orangeLight,
                  onPressed: () {
                    profileCubit.updateUserData(
                      profileCubit.nameController.text,
                      profileCubit.emailController.text,
                      profileCubit.passwordController.text,
                      profileCubit.addressController.text,
                      profileCubit.localImagePath ?? "",
                    );
                    profileCubit.getUserData();
                  },
                  text: "Sumpit",
                  width: double.infinity,
                  height: 48.h,
                ),
              ],
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
