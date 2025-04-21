List<OrderDetails> ordersFromJsom(List<dynamic> ordersItemJson) =>
    List<OrderDetails>.from(ordersItemJson
        .map((ordersItemJson) => OrderDetails.fromJson(ordersItemJson)));

class OrderDetails {
  String? orderId;
  String? shippingAddress;
  String? orderTotalPrice;
  String? orderStatus;
  String? orderCreatedAt;
  String? orderUpdatedAt;
  String? paymentMethod;
  String? paymentStatus;
  String? paymentAmount;
  String? paymentCreatedAt;
  UserDetails? userDetails;
  List<Items>? items;

  OrderDetails(
      {this.orderId,
      this.shippingAddress,
      this.orderTotalPrice,
      this.orderStatus,
      this.orderCreatedAt,
      this.orderUpdatedAt,
      this.paymentMethod,
      this.paymentStatus,
      this.paymentAmount,
      this.paymentCreatedAt,
      this.userDetails,
      this.items});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    shippingAddress = json['shipping_address'];
    orderTotalPrice = json['order_total_price'];
    orderStatus = json['order_status'];
    orderCreatedAt = json['order_created_at'];
    orderUpdatedAt = json['order_updated_at'];
    paymentMethod = json['payment_method'];
    paymentStatus = json['payment_status'];
    paymentAmount = json['payment_amount'];
    paymentCreatedAt = json['payment_created_at'];
    userDetails = json['user_details'] != null
        ? new UserDetails.fromJson(json['user_details'])
        : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['shipping_address'] = this.shippingAddress;
    data['order_total_price'] = this.orderTotalPrice;
    data['order_status'] = this.orderStatus;
    data['order_created_at'] = this.orderCreatedAt;
    data['order_updated_at'] = this.orderUpdatedAt;
    data['payment_method'] = this.paymentMethod;
    data['payment_status'] = this.paymentStatus;
    data['payment_amount'] = this.paymentAmount;
    data['payment_created_at'] = this.paymentCreatedAt;
    if (this.userDetails != null) {
      data['user_details'] = this.userDetails!.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserDetails {
  String? userId;
  String? name;
  String? email;
  String? phoneNumber;
  String? gender;
  String? address;
  String? userType;
  String? image;

  UserDetails(
      {this.userId,
      this.name,
      this.email,
      this.phoneNumber,
      this.gender,
      this.address,
      this.userType,
      this.image});

  UserDetails.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    gender = json['gender'];
    address = json['address'];
    userType = json['user_type'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['user_type'] = this.userType;
    data['image'] = this.image;
    return data;
  }
}

class Items {
  String? productId;
  String? productName;
  String? productImageUrl;
  String? categoryId;
  String? categoryName;
  String? quantity;
  String? itemTotalPrice;

  Items(
      {this.productId,
      this.productName,
      this.productImageUrl,
      this.categoryId,
      this.categoryName,
      this.quantity,
      this.itemTotalPrice});

  Items.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productImageUrl = json['product_image_url'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    quantity = json['quantity'];
    itemTotalPrice = json['item_total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_image_url'] = this.productImageUrl;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['quantity'] = this.quantity;
    data['item_total_price'] = this.itemTotalPrice;
    return data;
  }
}
