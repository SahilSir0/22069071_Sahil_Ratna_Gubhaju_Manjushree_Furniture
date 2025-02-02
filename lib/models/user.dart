class User {
  String? userId;
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  String? gender;
  String? address;
  String? userType;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? token;

  User(
      {this.userId,
      this.name,
      this.email,
      this.phoneNumber,
      this.password,
      this.gender,
      this.address,
      this.userType,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.token});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    password = json['password'];
    gender = json['gender'];
    address = json['address'];
    userType = json['user_type'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['password'] = this.password;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['user_type'] = this.userType;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['token'] = this.token;
    return data;
  }
}
