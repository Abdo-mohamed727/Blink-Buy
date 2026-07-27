
import 'package:blinkbuy/features/cart/presentation/view/widget/cart_item_widget.dart';
import 'package:blinkbuy/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        centerTitle: true,
      ),

      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {

          if (state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }


          if (state is CartError) {
            return Center(
              child: Text(state.message),
            );
          }


          if (state is CartGetSuccess) {

            if (state.items.isEmpty) {
              return const Center(
                child: Text(
                  "Your cart is empty",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              );
            }


            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.items.length,
              itemBuilder: (context, index) {

                final item = state.items[index];

                return CartItemWidget(
                  item: item,
                );
              },
            );
          }


          return const SizedBox();
        },
      ),
    );
  }
}