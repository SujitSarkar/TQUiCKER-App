import 'dart:convert';

List<VehicleLengthModel> vehicleLengthModelFromJson(String str) =>
    List<VehicleLengthModel>.from(json.decode(str).map((x) => VehicleLengthModel.fromJson(x)));

class VehicleLengthModel {
  VehicleLengthModel({
    this.id,
    this.vehiclelength,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? vehiclelength;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory VehicleLengthModel.fromJson(Map<String, dynamic> json) => VehicleLengthModel(
    id: json["id"],
    vehiclelength: json["vehiclelength"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}
