List<Product> productsFromJsom(List<dynamic> productsItemJson) =>
    List<Product>.from(productsItemJson
        .map((productsItemJson) => Product.fromJson(productsItemJson)));

class Product {
  String? productId;
  String? productName;
  String? productPrice;
  String? productQuantity;
  String? productDescription;
  String? productImage;
  String? productCreatedAt;
  String? categoryId;
  String? categoryName;
  String? totalSold;
  List<Skus>? skus;

  Product(
      {this.productId,
      this.productName,
      this.productPrice,
      this.productQuantity,
      this.productDescription,
      this.productImage,
      this.productCreatedAt,
      this.categoryId,
      this.categoryName,
      this.totalSold,
      this.skus});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productQuantity = json['product_quantity'];
    productDescription = json['product_description'];
    productImage = json['product_image'];
    productCreatedAt = json['product_created_at'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    totalSold = json['total_sold'];
    if (json['skus'] != null) {
      skus = <Skus>[];
      json['skus'].forEach((v) {
        skus!.add(new Skus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_price'] = this.productPrice;
    data['product_quantity'] = this.productQuantity;
    data['product_description'] = this.productDescription;
    data['product_image'] = this.productImage;
    data['product_created_at'] = this.productCreatedAt;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['total_sold'] = this.totalSold;
    if (this.skus != null) {
      data['skus'] = this.skus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Skus {
  String? productSkuId;
  String? skuSize;
  String? skuCode;

  Skus({this.productSkuId, this.skuSize, this.skuCode});

  Skus.fromJson(Map<String, dynamic> json) {
    productSkuId = json['product_sku_id'];
    skuSize = json['sku_size'];
    skuCode = json['sku_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_sku_id'] = this.productSkuId;
    data['sku_size'] = this.skuSize;
    data['sku_code'] = this.skuCode;
    return data;
  }
}
