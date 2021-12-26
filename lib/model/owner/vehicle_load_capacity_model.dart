import 'dart:convert';

List<VehicleLoadCapacityModel> vehicleLoadCapacityModelFromJson(String str) => List<VehicleLoadCapacityModel>.from(json.decode(str).map((x) => VehicleLoadCapacityModel.fromJson(x)));

class VehicleLoadCapacityModel {
  VehicleLoadCapacityModel({
    this.id,
    this.loadcapacity,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? loadcapacity;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory VehicleLoadCapacityModel.fromJson(Map<String, dynamic> json) => VehicleLoadCapacityModel(
    id: json["id"],
    loadcapacity: json["loadcapacity"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}
