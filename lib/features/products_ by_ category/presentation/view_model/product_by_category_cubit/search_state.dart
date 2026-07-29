import 'package:blinkbuy/core/model/item/product_item_entity.dart';

sealed class SearchState {}
class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}
class SearchEmpty extends SearchState {}
class SearchSuccess extends SearchState {
  final List<ProductItemEntity> products;
  SearchSuccess(this.products);
}
class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}

