import 'package:blinkbuy/features/cart/domain/entity/cart_entity.dart';
import 'package:blinkbuy/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemWidget extends StatelessWidget {
  final CartEntity item;

  const CartItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),

      child: Padding(
        padding: const EdgeInsets.all(12),

        child: Row(
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),

              child: Image.network(
                item.images,
                width: 80,
                height: 80,
                fit: BoxFit.cover,

                errorBuilder: (_, __, ___) {
                  return const Icon(Icons.image, size: 50);
                },
              ),
            ),

            const SizedBox(width: 12),

            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,

                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "\$${item.price}",
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove),
                      ),

                      Text(
                        "${item.quantity}",
                        style: const TextStyle(fontSize: 16),
                      ),

                      IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                    ],
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: () {
                context.read<CartCubit>().deleteFromCart(item);
              },

              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
