import 'dart:io';

import 'package:blinkbuy/core/constants/api_constant.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/features/account/presentation/view/widgets/custom_profile_shimmer.dart';
import 'package:blinkbuy/features/account/presentation/view/widgets/profile_view_body.dart';
import 'package:blinkbuy/features/account/presentation/view_model/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();

          if (state is ProfileLoading || state is ImageLoading) {
            return const ProfileHeaderShimmer();
          }

          if (state is ProfileSuccess) {
            ImageProvider? imageProvider;

            if (cubit.localImagePath != null &&
                cubit.localImagePath!.isNotEmpty) {
              imageProvider = FileImage(File(cubit.localImagePath!));
            } else if (state.userEntity.message.image.isNotEmpty) {
              imageProvider = NetworkImage(
                "${ApiConstant.mediaUrl}${state.userEntity.message.image}",
              );
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 270.h,
                    width: double.infinity,
                    padding: EdgeInsets.only(bottom: 30.h),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.r),
                        bottomRight: Radius.circular(30.r),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 50.h),
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 55.h,
                                backgroundColor: AppColors.lightGrey,
                                backgroundImage: imageProvider,
                                child: imageProvider == null
                                    ? Icon(
                                        Icons.person,
                                        size: 55.h,
                                        color: AppColors.primaryColor,
                                      )
                                    : null,
                              ),
                            ),

                            InkWell(
                              onTap: () {
                                cubit.addImage();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: AppColors.primaryColor,
                                  size: 20.h,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 16.h),

                        Text(
                          state.userEntity.message.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(height: 6.h),

                        Text(
                          state.userEntity.message.email,
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 25.h),

                  ProfileViewBody(),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
