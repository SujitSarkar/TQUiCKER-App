import 'dart:convert';

OwnerRegResponseModel ownerRegResponseModelFromJson(String str) => OwnerRegResponseModel.fromJson(json.decode(str));

class OwnerRegResponseModel {
  OwnerRegResponseModel({
    this.msg,
    this.token,
    this.data,
  });
  String? msg;
  String? token;
  RegData? data;

  factory OwnerRegResponseModel.fromJson(Map<String, dynamic> json) => OwnerRegResponseModel(
    msg: json["msg"],
    token: json["token"],
    data: RegData.fromJson(json["data"]),
  );
}

class RegData {
  RegData({
    this.name,
    this.email,
    this.contactNo,
    this.nationalId,
    this.contactAddress,
    this.password,
    this.status,
    this.image,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? name;
  String? email;
  String? contactNo;
  String? nationalId;
  String? contactAddress;
  String? password;
  int? status;
  String? image;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory RegData.fromJson(Map<String, dynamic> json) => RegData(
    name: json["name"],
    email: json["email"],
    contactNo: json["contact_no"],
    nationalId: json["national_id"],
    contactAddress: json["contact_address"],
    password: json["password"],
    status: json["status"],
    image: json["image"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );
}
