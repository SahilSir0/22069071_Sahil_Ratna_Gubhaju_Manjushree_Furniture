class Api {
  static const String baseUrl = "http://172.25.5.188/manjushree_backend/api";

  static const String loginUrl = "$baseUrl/customer_login.php";
  static const String registerUrl = "$baseUrl/register_user.php";
  static const String verifyOtpUrl = "$baseUrl/verify_otp.php";
  static const String getCategoryUrl = "$baseUrl/get_categories.php";
  static const String getProductUrl = "$baseUrl/get_product.php";
  static const String addOrderUrl = "$baseUrl/add_order.php";
  static const String editProfileUrl = "$baseUrl/edit_user.php";
  static const String getChatDetailsUrl = "$baseUrl/get_chat.php";
  static const String getOrderUrl = "$baseUrl/get_order.php";
  static const String addCartUrl = "$baseUrl/add_cart.php";
  static const String getCartItemUrl = "$baseUrl/get_cart_items.php";
  static const String deleteCartUrl = "$baseUrl/delete_cartitem.php";
}
