List<Product> productsFromJsom(List<dynamic> productsItemJson) =>
    List<Product>.from(productsItemJson
        .map((productsItemJson) => Product.fromJson(productsItemJson)));

class Product {
  String? productId;
  String? productName;
  String? productPrice;
  String? quantity;
  String? productImage;
  String? description;
  String? productCreatedAt;
  String? categoryId;
  String? categoryName;
  String? productSkuId;
  String? skuSize;
  String? skuCode;
  String? reviewId;
  String? reviewComment;
  String? reviewRating;
  String? reviewDate;

  Product(
      {this.productId,
      this.productName,
      this.productPrice,
      this.quantity,
      this.productImage,
      this.description,
      this.productCreatedAt,
      this.categoryId,
      this.categoryName,
      this.productSkuId,
      this.skuSize,
      this.skuCode,
      this.reviewId,
      this.reviewComment,
      this.reviewRating,
      this.reviewDate});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    quantity = json['quantity'];
    productImage = json['product_image'];
    description = json['description'];
    productCreatedAt = json['product_created_at'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    productSkuId = json['product_sku_id'];
    skuSize = json['sku_size'];
    skuCode = json['sku_code'];
    reviewId = json['review_id'];
    reviewComment = json['review_comment'];
    reviewRating = json['review_rating'];
    reviewDate = json['review_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_price'] = this.productPrice;
    data['quantity'] = this.quantity;
    data['product_image'] = this.productImage;
    data['description'] = this.description;
    data['product_created_at'] = this.productCreatedAt;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['product_sku_id'] = this.productSkuId;
    data['sku_size'] = this.skuSize;
    data['sku_code'] = this.skuCode;
    data['review_id'] = this.reviewId;
    data['review_comment'] = this.reviewComment;
    data['review_rating'] = this.reviewRating;
    data['review_date'] = this.reviewDate;
    return data;
  }
}
