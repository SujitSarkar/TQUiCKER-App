import 'dart:convert';

List<VehicleSeatCapacityModel> vehicleSeatCapacityModelFromJson(String str) => List<VehicleSeatCapacityModel>.from(json.decode(str).map((x) => VehicleSeatCapacityModel.fromJson(x)));

class VehicleSeatCapacityModel {
  VehicleSeatCapacityModel({
    this.id,
    this.seatcapacity,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? seatcapacity;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory VehicleSeatCapacityModel.fromJson(Map<String, dynamic> json) => VehicleSeatCapacityModel(
    id: json["id"],
    seatcapacity: json["seatcapacity"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}
