import 'package:blinkbuy/features/cart/domain/entity/cart_entity.dart';

class CartDto {
  final String images;
  final int id;
  final String title;
  final double price;
  final int quantity;

  CartDto({
    required this.id,
    required this.title,
    required this.price,
    required this.images,
    required this.quantity,
  });

  factory CartDto.fromJson(Map<String, dynamic> json) {
    return CartDto(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      images: (json['images'] as List).isNotEmpty ? json['images'][0] : '',
      quantity: json['quantity'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'images': [images],
      'quantity': quantity,
    };
  }

  CartEntity toEntity() {
    return CartEntity(
      id: id,
      title: title,
      price: price,
      images: images,
      quantity: quantity,
    );
  }
}