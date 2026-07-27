class ApiConstant {
  static const String baseUrl = "https://supermarket-dan1.onrender.com/";
  static const String getProducts = "${baseUrl}api/v1/home/products";
  static const String getCategories = "${baseUrl}api/v1/home/categories";
  static const String getCartItems = "${baseUrl}api/v1/user/getCart";
  static const String addToCart = "${baseUrl}api/v1/user/addCart";
  static const String deleteFromCart = "${baseUrl}api/v1/user/deleteCart";
}
