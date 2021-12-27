class AmbulanceModel{
  String? id;
  String? ambulance;
  AmbulanceModel({this.id, this.ambulance});

  static List<AmbulanceModel> ambulanceList=[
    AmbulanceModel(id: '0', ambulance: 'Individual Ambulance'),
    AmbulanceModel(id: '1', ambulance: 'Mobile ICU Ambulance'),
    AmbulanceModel(id: '2', ambulance: 'Basic Life Support Ambulance')];
}