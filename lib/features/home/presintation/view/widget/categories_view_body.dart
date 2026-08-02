import 'package:blinkbuy/core/route/app_routes.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/core/theme/styels.dart';
import 'package:blinkbuy/features/home/presintation/view/widget/category_list_shimmer.dart';
import 'package:blinkbuy/features/home/presintation/view_model/get_categories/get_categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
        builder: (context, state) {
          if (state is GetCategoriesLoading) {
            return CategoriesListShimmer();
          }
          if (state is GetCategoriesError) {
            return Center(child: Text(state.messageError));
          }
          if (state is GetCategoriesSuccess) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: state.categories.categories.length,
              separatorBuilder: (context, _) => SizedBox(width: 10.w),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.productByCategoryScreen,
                      arguments: {
                        'slug': state.categories.categories[index].slug,
                        'category': state.categories.categories[index].name,
                      },
                    );
                    context.read<GetCategoriesCubit>().changeCategory(index);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 8.w, bottom: 3.h),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      border: Border.all(color: AppColors.primaryColor),
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 27.w,
                      vertical: 8.h,
                    ),
                    child: Text(
                      state.categories.categories[index].name,

                      style: AppTextStyles.font14Regular.copyWith(
                        color: AppColors.primaryColorBlack,
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
