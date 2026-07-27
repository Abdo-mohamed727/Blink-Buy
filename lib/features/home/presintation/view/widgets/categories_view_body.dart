import 'package:blinkbuy/core/route/app_routes.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/core/theme/styels.dart';
import 'package:blinkbuy/features/home/presintation/view/widgets/category_list_shimmer.dart';
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
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      color: index == state.selectedIndex
                          ? AppColors.primaryColor
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 27,
                      vertical: 11,
                    ),
                    child: Text(
                      state.categories.categories[index].name,

                      style: TextStyles.font14Regular.copyWith(
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
