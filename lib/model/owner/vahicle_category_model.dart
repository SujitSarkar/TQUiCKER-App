import 'dart:convert';

List<VehicleCategoryModel> vehicleCategoryModelFromJson(String str) => List<VehicleCategoryModel>.from(json.decode(str).map((x) => VehicleCategoryModel.fromJson(x)));

class VehicleCategoryModel {
  VehicleCategoryModel({
    this.id,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? category;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory VehicleCategoryModel.fromJson(Map<String, dynamic> json) => VehicleCategoryModel(
    id: json["id"],
    category: json["category"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}
