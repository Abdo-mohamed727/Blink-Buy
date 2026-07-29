abstract class ApiConstant {
  static const String baseUrl = "https://supermarket-dan1.onrender.com/api/v1";
  static const String product = "$baseUrl/home/products/category/";
  static const String getProducts = "$baseUrl/home/products";
  static const String getCategories = "$baseUrl/home/categories";
  static const String getFavrouite = "$baseUrl/user/getFavorite";
  static const String addFavrouite = "$baseUrl/user/addFavorite";
  static const String removeFavrouite = "$baseUrl/user/deleteFavorite";
  static const String addToCart = "$baseUrl/user/addCart";
  static const String deleteFromCart = "$baseUrl/user/deleteCart";
  static const String getCartItems = "$baseUrl/user/getCart";
  static const String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhNjc5MDUyOGI3OGVhZTUzZjM0YjdlZSIsImlhdCI6MTc4NTE3MjE1OSwiZXhwIjoxNzg3NzY0MTU5fQ.32knO1kL3TDRCN9luRe3fP19wNxTaFQgles9ca57YT0";
}
