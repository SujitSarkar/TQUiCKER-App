import 'dart:convert';

List<OwnerVehicleModel> ownerVehicleModelFromJson(String str) => List<OwnerVehicleModel>.from(json.decode(str).map((x) => OwnerVehicleModel.fromJson(x)));

class OwnerVehicleModel {
  OwnerVehicleModel({
    this.id,
    this.ownerId,
    this.vhCategory,
    this.vhType,
    this.metroNameId,
    this.metroSerialId,
    this.vhNumber,
    this.vhContactNo,
    this.vhLoadCapacity,
    this.vhSeatCapacity,
    this.vhLength,
    this.vhStand,
    this.vhBrand,
    this.vhModel,
    this.vhMfgYear,
    this.vhAmbulanceType,
    this.vhAcStatus,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? ownerId;
  int? vhCategory;
  int? vhType;
  int? metroNameId;
  int? metroSerialId;
  String? vhNumber;
  String? vhContactNo;
  int? vhLoadCapacity;
  int? vhSeatCapacity;
  int? vhLength;
  String? vhStand;
  String? vhBrand;
  String? vhModel;
  int? vhMfgYear;
  int? vhAmbulanceType;
  int? vhAcStatus;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory OwnerVehicleModel.fromJson(Map<String, dynamic> json) => OwnerVehicleModel(
    id: json["id"],
    ownerId: json["owner_id"],
    vhCategory: json["vh_category"],
    vhType: json["vh_type"],
    metroNameId: json["metro_name_id"],
    metroSerialId: json["metro_serial_id"],
    vhNumber: json["vh_number"],
    vhContactNo: json["vh_contact_no"],
    vhLoadCapacity: json["vh_load_capacity"],
    vhSeatCapacity: json["vh_seat_capacity"],
    vhLength: json["vh_length"],
    vhStand: json["vh_stand"],
    vhBrand: json["vh_brand"],
    vhModel: json["vh_model"],
    vhMfgYear: json["vh_mfg_year"],
    vhAmbulanceType: json["vh_ambulance_type"],
    vhAcStatus: json["vh_ac_status"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}
