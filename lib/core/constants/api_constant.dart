abstract class ApiConstant {
  static const String baseUrl = "https://supermarket-dan1.onrender.com/api/v1";
  static const String product = "$baseUrl/home/products/category/";
  static const String getProducts = "$baseUrl/home/products";
  static const String getCategories = "$baseUrl/home/categories";
  static const String getFavrouite = "$baseUrl/user/getFavorite";
  static const String addFavrouite = "$baseUrl/user/addFavorite";
  static const String removeFavrouite = "$baseUrl/user/deleteFavorite";
}
