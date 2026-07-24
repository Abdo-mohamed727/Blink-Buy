part of 'get_categories_cubit.dart';

 
sealed class GetCategoriesState {}

final class GetCategoriesInitial extends GetCategoriesState {}

final class GetCategoriesLoading extends GetCategoriesState {}

final class GetCategoriesSuccess extends GetCategoriesState {
  final CategoriesEntity categories;
  GetCategoriesSuccess(this.categories);
}

final class GetCategoriesError extends GetCategoriesState {
  final String messageError;
  GetCategoriesError(this.messageError);
}
  