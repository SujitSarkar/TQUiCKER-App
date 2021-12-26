import 'dart:convert';

List<VehicleMetroSerialModel> vehicleMetroSerialModelFromJson(String str) => List<VehicleMetroSerialModel>.from(json.decode(str).map((x) => VehicleMetroSerialModel.fromJson(x)));

class VehicleMetroSerialModel {
  VehicleMetroSerialModel({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory VehicleMetroSerialModel.fromJson(Map<String, dynamic> json) => VehicleMetroSerialModel(
    id: json["id"],
    name: json["name"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );
}
