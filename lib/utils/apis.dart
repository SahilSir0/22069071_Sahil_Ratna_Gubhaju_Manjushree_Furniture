class Api {
  static const String baseUrl = "http://192.168.1.68/manjushree_backend/api";
  static const String loginUrl = "$baseUrl/customer_login.php";
  static const String registerUrl = "$baseUrl/register_user.php";
  static const String verifyOtpUrl = "$baseUrl/verify_otp.php";
  static const String getCategoryUrl = "$baseUrl/get_categories.php";
  static const String getProductUrl = "$baseUrl/get_product.php";
  static const String addOrderUrl = "$baseUrl/add_order.php";
  static const String editProfileUrl = "$baseUrl/edit_user.php";

  static const String products = "$baseUrl/products";
  static const String orders = "$baseUrl/orders";

  static const String bookings = "$baseUrl/bookings";
  static const String user = "$baseUrl/user";
  static const String subscription = "$baseUrl/suscribe";
}
