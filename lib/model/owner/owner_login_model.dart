import 'dart:convert';

OwnerLoginResponseModel ownerLoginResponseModelFromJson(String str) => OwnerLoginResponseModel.fromJson(json.decode(str));

class OwnerLoginResponseModel {
  OwnerLoginResponseModel({
    this.success,
    this.token,
    this.userId,
    this.user,
  });

  int? success;
  String? token;
  int? userId;
  User? user;

  factory OwnerLoginResponseModel.fromJson(Map<String, dynamic> json) => OwnerLoginResponseModel(
    success: json["success"],
    token: json["token"],
    userId: json["user_id"],
    user: User.fromJson(json["user"]),
  );
}

class User {
  User({
    this.id,
    this.nationalId,
    this.name,
    this.contactNo,
    this.contactAddress,
    this.email,
    this.password,
    this.image,
    this.apiToken,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? nationalId;
  String? name;
  String? contactNo;
  String? contactAddress;
  String? email;
  String? password;
  String? image;
  String? apiToken;
  int? status;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    nationalId: json["national_id"],
    name: json["name"],
    contactNo: json["contact_no"],
    contactAddress: json["contact_address"],
    email: json["email"],
    password: json["password"],
    image: json["image"],
    apiToken: json["api_token"],
    status: json["status"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}
