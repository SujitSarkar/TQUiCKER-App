import 'dart:convert';

List<DriverListModel> driverListModelFromJson(String str) => List<DriverListModel>.from(json.decode(str).map((x) => DriverListModel.fromJson(x)));

class DriverListModel {
  DriverListModel({
    this.id,
    this.vahicalsId,
    this.name,
    this.contactNo,
    this.nationalId,
    this.email,
    this.password,
    this.contactAddress,
    this.dlLincenceNo,
    this.status,
    this.apiToken,
    this.createdAt,
    this.updatedAt,
    this.ownerId,
  });

  int? id;
  int? vahicalsId;
  String? name;
  String? contactNo;
  String? nationalId;
  String? email;
  String? password;
  String? contactAddress;
  String? dlLincenceNo;
  int? status;
  String? apiToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? ownerId;

  factory DriverListModel.fromJson(Map<String, dynamic> json) => DriverListModel(
    id: json["id"],
    vahicalsId: json["vahicals_id"],
    name: json["name"],
    contactNo: json["contact_no"],
    nationalId: json["national_id"],
    email: json["email"],
    password: json["password"],
    contactAddress: json["contact_address"],
    dlLincenceNo: json["dl_lincence_no"],
    status: json["status"],
    apiToken: json["api_token"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    ownerId: json["owner_id"],
  );

}
