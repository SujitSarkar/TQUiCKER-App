import 'dart:convert';

List<MetroNameModel> metroNameModelFromJson(String str) => List<MetroNameModel>.from(json.decode(str).map((x) => MetroNameModel.fromJson(x)));

class MetroNameModel {
  MetroNameModel({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory MetroNameModel.fromJson(Map<String, dynamic> json) => MetroNameModel(
    id: json["id"],
    name: json["name"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

}
