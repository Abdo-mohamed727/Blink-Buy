import 'package:blinkbuy/core/comman/widgets/coustom_text_form_field.dart';
import 'package:blinkbuy/core/di/service_locator.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/core/theme/styels.dart';
import 'package:blinkbuy/features/products_%20by_%20category/presentation/view/utils/debounce.dart';
import 'package:blinkbuy/features/products_%20by_%20category/presentation/view/widget/product_by_category_view_body.dart';
import 'package:blinkbuy/features/products_%20by_%20category/presentation/view/widget/search_view_body.dart';
import 'package:blinkbuy/features/products_%20by_%20category/presentation/view_model/product_by_category_cubit/product_by_category_cubit.dart';
import 'package:blinkbuy/features/products_%20by_%20category/presentation/view_model/product_by_category_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductByCategoryScreen extends StatefulWidget {
  const ProductByCategoryScreen({super.key});

  @override
  State<ProductByCategoryScreen> createState() =>
      _ProductByCategoryScreenState();
}

class _ProductByCategoryScreenState extends State<ProductByCategoryScreen> {
  bool isSearch = false;

  final TextEditingController searchController = TextEditingController();

  final Debouncer debouncer = Debouncer(milliseconds: 500);

  @override
  void dispose() {
    debouncer.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final slug = args['slug'] as String;
    final categoryName = args['category'] as String;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => serviceLocator<SearchCubit>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<ProductByCategoryCubit>()
            ..getProductsByCategory(
              slug,
              categoryName,
            ),
        ),
      ],
      child: Builder(
        builder: (context) {
          void searchFun() {
            setState(() {
              isSearch = !isSearch;

              if (!isSearch) {
                searchController.clear();

                context
                    .read<ProductByCategoryCubit>()
                    .getProductsByCategory(
                      slug,
                      categoryName,
                    );
              }
            });
          }

          onSearchChanged(String value) {
            debouncer.run(() {
              if (value.trim().isEmpty) {
                context
                    .read<ProductByCategoryCubit>()
                    .getProductsByCategory(
                      slug,
                      categoryName,
                    );
              } else {
                context
                    .read<SearchCubit>()
                    .searchProducts(value);
              }
            });
          }

          return Scaffold(
            appBar: isSearch
                ? AppBar(
                    toolbarHeight: 70.h,
                    automaticallyImplyLeading: false,
                    centerTitle: false,
                    title: CustomTextField(
                      controller: searchController,
                      onChanged: onSearchChanged,
                      hintText: 'Search for your products',
                      prefixIcon: IconButton(
                        onPressed: searchFun,
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.defaultBorderColor,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  )
                : AppBar(
                    toolbarHeight: 70.h,
                    centerTitle: true,
                    title: Text(
                      categoryName,
                      style: TextStyles.font22SemiBold,
                    ),
                    actions: [
                      IconButton(
                        onPressed: searchFun,
                        icon: Icon(
                          Icons.search,
                          color: AppColors.defaultBorderColor,
                          size: 30.sp,
                        ),
                      ),
                    ],
                  ),
            body: isSearch
                ? const SearchViewBody()
                : const ProductByCategoryViewBody(),
          );
        },
      ),
    );
  }
}