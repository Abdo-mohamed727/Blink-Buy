import 'package:blinkbuy/core/comman/widgets/nva_btn.dart';
import 'package:blinkbuy/core/constants/app_images.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/features/app_section/view_model/cubit/app_section_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        final state = context.read<AppSectionCubit>();
        return Scaffold(
          body: state.pages[state.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            enableFeedback: false,
            backgroundColor: AppColors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.charcoal,
            currentIndex: state.currentIndex,
            onTap: state.changeSection,
            items: [
              BottomNavigationBarItem(
                icon: navIcon(
                  path: AppImages.homeIcon,
                  isSelected: state.currentIndex == 0,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: navIcon(
                  path: AppImages.cartIcon,
                  isSelected: state.currentIndex == 1,
                ),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: navIcon(
                  path: AppImages.favouriteIcon,
                  isSelected: state.currentIndex == 2,
                ),
                label: "Favourites",
              ),
              BottomNavigationBarItem(
                icon: navIcon(
                  path: AppImages.profileIcon,
                  isSelected: state.currentIndex == 3,
                ),
                label: "Profile",
              ),
            ],
          ),
        );
      },
    );
  }
}
