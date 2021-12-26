import 'dart:convert';

List<VehicleTypeModel> vehicleTypeModelFromJson(String str) => List<VehicleTypeModel>.from(json.decode(str).map((x) => VehicleTypeModel.fromJson(x)));

class VehicleTypeModel {
  VehicleTypeModel({
    this.id,
    this.vehicalCategoryId,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? vehicalCategoryId;
  String? type;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory VehicleTypeModel.fromJson(Map<String, dynamic> json) => VehicleTypeModel(
    id: json["id"],
    vehicalCategoryId: json["vehical_category_id"],
    type: json["type"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}
