abstract class ApiConstant {
  static const String baseUrl = "https://supermarket-dan1.onrender.com/api/v1";
  static const String mediaUrl = "https://supermarket-dan1.onrender.com/";
  static const String product = "$baseUrl/home/products/category/";
  static const String getProducts = "$baseUrl/home/products";
  static const String getCategories = "$baseUrl/home/categories";
  static const String profile = "$baseUrl/portfoilo/userData";
  static const String updateProfile = "$baseUrl/portfoilo/editUserData";
  static const String addProfileImage = "$baseUrl/portfoilo/addImage";
  
  static const String getFavrouite = "$baseUrl/user/getFavorite";
  static const String addFavrouite = "$baseUrl/user/addFavorite";
  static const String removeFavrouite = "$baseUrl/user/deleteFavorite";
  static const String addToCart = "$baseUrl/user/addCart";
  static const String deleteFromCart = "$baseUrl/user/deleteCart";
  static const String getCartItems = "$baseUrl/user/getCart";
  static const String signIn = "$baseUrl/auth/signIn";
  
  static  const String getProductsSearch="$baseUrl/home/productsFilter";
  static const String signUp = "$baseUrl/auth/signUp";
  
}
