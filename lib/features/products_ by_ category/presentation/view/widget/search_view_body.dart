import 'package:blinkbuy/core/comman/widgets/product_list-shimmer.dart';
import 'package:blinkbuy/features/products_%20by_%20category/presentation/view_model/product_by_category_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/product_by_category_cubit/search_state.dart';
import 'product_view.dart';

class  SearchViewBody  extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(

      builder: (context, state) {
          print(state);
        return switch(state) {
          SearchInitial() => const SizedBox(),
          SearchLoading() =>ProductsListShimmer (
                    crossAxisCount: 2,
                    childAspectRatio: 163 / 288,
                  ),
          SearchEmpty() => const Center(
            child: Text('No products found'),
          ),
        
          SearchSuccess() => ProductByCategory(
            products: state.products,
          ),
          SearchError() =>  Center(
            child: Text(state.message),
          ),
        } ;
      },
    );
  }
}