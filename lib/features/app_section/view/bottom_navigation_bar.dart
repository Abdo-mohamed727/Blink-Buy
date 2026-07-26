import 'package:blinkbuy/core/comman/widgets/nva_btn.dart';
import 'package:blinkbuy/core/constants/app_images.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/features/app_section/view_model/cubit/app_section_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSectionScreen extends StatefulWidget {
  const AppSectionScreen({super.key});

  @override
  State<AppSectionScreen> createState() => _AppSectionScreenState();
}

class _AppSectionScreenState extends State<AppSectionScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSectionCubit, AppSectionState>(
      builder: (context, state) {
        final cubit = context.read<AppSectionCubit>();

        return Scaffold(
          extendBody: true,
          body: Stack(
            children: [
              cubit.pages[cubit.currentIndex],

              Positioned(
                left: 20,
                right: 20,
                bottom: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(30.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.12),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.r),
                    child: BottomNavigationBar(
                      elevation: 5,
                      backgroundColor: AppColors.white,
                      type: BottomNavigationBarType.fixed,
                      enableFeedback: false,
                      currentIndex: cubit.currentIndex,
                      onTap: cubit.changeSection,
                      selectedItemColor: AppColors.primaryColor,
                      unselectedItemColor: AppColors.charcoal,
                      showSelectedLabels: true,
                      showUnselectedLabels: true,
                      items: [
                        BottomNavigationBarItem(
                          icon: navIcon(
                            path: AppImages.homeIcon,
                            isSelected: cubit.currentIndex == 0,
                          ),
                          label: "Home",
                        ),
                        BottomNavigationBarItem(
                          icon: navIcon(
                            path: AppImages.cartIcon,
                            isSelected: cubit.currentIndex == 1,
                          ),
                          label: "Cart",
                        ),
                        BottomNavigationBarItem(
                          icon: navIcon(
                            path: AppImages.favouriteIcon,
                            isSelected: cubit.currentIndex == 2,
                          ),
                          label: "Favourites",
                        ),
                        BottomNavigationBarItem(
                          icon: navIcon(
                            path: AppImages.profileIcon,
                            isSelected: cubit.currentIndex == 3,
                          ),
                          label: "Profile",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
