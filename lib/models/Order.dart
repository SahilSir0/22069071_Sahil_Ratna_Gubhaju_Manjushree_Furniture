class OrderModel {
  final String orderId;
  final String productName;
  final String shippingAddress;
  final String date;
  final int quantity;
  final double totalPrice;
  final String paymentMethod;

  OrderModel({
    required this.orderId,
    required this.productName,
    required this.shippingAddress,
    required this.date,
    required this.quantity,
    required this.totalPrice,
    required this.paymentMethod,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['orderId'],
      productName: json['productName'],
      shippingAddress: json['shippingAddress'],
      date: json['date'],
      quantity: json['quantity'],
      totalPrice: (json['totalPrice'] as num).toDouble(),
      paymentMethod: json['paymentMethod'],
    );
  }
}
