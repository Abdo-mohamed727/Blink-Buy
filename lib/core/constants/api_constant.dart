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
  static const String signIn = "$baseUrl/auth/signIn";
  static const String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhNjk4NDY0NWNmOGZjNjgxY2YxNTY5YSIsImlhdCI6MTc4NTMwNjc5MSwiZXhwIjoxNzg3ODk4NzkxfQ.h-EpZsMmhUBI6wl9mW83bJdSTuHtuwKfR32rDqeE-oo";
}
