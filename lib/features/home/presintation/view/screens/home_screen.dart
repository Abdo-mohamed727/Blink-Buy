import 'package:blinkbuy/core/comman/widgets/product_item_card.dart';
import 'package:blinkbuy/core/constants/app_images.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/core/theme/styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedNavIndex = 0;

  final List<String> _categories = [
    'Miscellaneous',
    'Shoes',
    'Furniture',
    'Electronics',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        style: TextStyles.font14Regular.copyWith(
                          color: AppColors.primaryColorBlack,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        "Let's start your day",
                        style: TextStyles.font14Regular.copyWith(
                          color: AppColors.primaryColorBlack,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 40.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    itemCount: _categories.length,
                    separatorBuilder: (_, __) => SizedBox(width: 10.w),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => setState(() {}),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.primaryColorBlack,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            _categories[index],
                            style: TextStyles.font14Regular.copyWith(
                              color: AppColors.primaryColorBlack,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16.h),

                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 12.h),
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemBuilder: (context, index) {
                      return ProductItemWidget(
                        imageUrl: AppImages.networkImage,
                        price: 199,
                        productName: 'Product Name',
                        onFavoriteToggle: (isFavorite) {},
                        onTap: () {},
                        currency: "USA",
                        isFavorite: true,
                        productItemEntity: null,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedNavIndex,
      //   onTap: (index) => setState(() => _selectedNavIndex = index),
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: AppColors.primaryColorBlack,
      //   unselectedItemColor: AppColors.primaryColorBlack.withOpacity(0.5),
      //   showSelectedLabels: true,
      //   showUnselectedLabels: true,
      //   selectedFontSize: 14,
      //   unselectedFontSize: 14,
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.home_outlined), label: 'Home'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.favorite_border), label: 'Favourite'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.person_outline), label: 'Account'),
      //   ],
      // ),
    );
  }
}
