import 'dart:io';

import 'package:blinkbuy/core/theme/app_colors.dart';
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
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 102.h),
        child: Column(
          children: [
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                final cubit = context.read<ProfileCubit>();

                if (state is ProfileLoading || state is ImageLoading) {
                  return const CircularProgressIndicator();
                }

                if (state is ProfileSuccess) {
                  ImageProvider? imageProvider;

                  // إذا المستخدم اختار صورة جديدة
                  if (cubit.localImagePath != null &&
                      cubit.localImagePath!.isNotEmpty) {
                    imageProvider = FileImage(File(cubit.localImagePath!));
                  }
                  // غير ذلك اعرض الصورة القادمة من الـ API
                  else if (state.userEntity.message.image != null &&
                      state.userEntity.message.image!.isNotEmpty) {
                    imageProvider = NetworkImage(
                      "https://supermarket-dan1.onrender.com/${state.userEntity.message.image!}",
                    );
                  }

                  return Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.charcoal,
                        backgroundImage: imageProvider,
                        child: imageProvider == null
                            ? const Icon(Icons.person, color: AppColors.white)
                            : null,
                      ),
                      Positioned(
                        bottom: 5,
                        right: 2,
                        child: InkWell(
                          onTap: () {
                            context.read<ProfileCubit>().addImage();
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.lightGrey,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(6),
                            child: Icon(Icons.camera_alt_outlined, size: 24.sp),
                          ),
                        ),
                      ),
                    ],
                  );
                }

                return const SizedBox.shrink();
              },
            ),

            ProfileViewBody(),
          ],
        ),
      ),
    );
  }
}
