List<CartItem> cartItemsFromJsom(List<dynamic> cartItemsItemJson) =>
    List<CartItem>.from(cartItemsItemJson
        .map((cartItemsItemJson) => CartItem.fromJson(cartItemsItemJson)));

class CartItem {
  String? cartId;
  String? cartItemId;
  String? productId;
  String? productSkuId;
  String? quantity;
  String? categoryId;
  String? categoryName;
  String? productName;
  String? price;
  String? image;

  CartItem(
      {this.cartId,
      this.cartItemId,
      this.productId,
      this.productSkuId,
      this.quantity,
      this.categoryId,
      this.categoryName,
      this.productName,
      this.price,
      this.image});

  CartItem.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    cartItemId = json['cart_item_id'];
    productId = json['product_id'];
    productSkuId = json['product_sku_id'];
    quantity = json['quantity'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    productName = json['product_name'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_id'] = this.cartId;
    data['cart_item_id'] = this.cartItemId;
    data['product_id'] = this.productId;
    data['product_sku_id'] = this.productSkuId;
    data['quantity'] = this.quantity;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['product_name'] = this.productName;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}
