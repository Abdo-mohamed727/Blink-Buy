import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/core/theme/styels.dart';
import 'package:blinkbuy/features/home/presintation/view/widgets/categories_view_body.dart';
import 'package:blinkbuy/features/home/presintation/view/widgets/products_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final crossAxisCount = screenWidth >= 900
                ? 4
                : screenWidth >= 600
                ? 3
                : 2;
            final childAspectRatio = screenWidth >= 900
                ? 0.82
                : screenWidth >= 600
                ? 0.78
                : 0.72;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi !,',
                        style: TextStyles.font16Regular.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColorBlack,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        "Let's start your day",
                        style: TextStyles.font18SemiBold.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColorBlack,
                        ),
                      ),
                    ],
                  ),
                ),

                CategoriesViewBody(),
                SizedBox(height: 16.h),

                ProductsViewBody(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: childAspectRatio,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
