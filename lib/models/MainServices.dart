import 'dart:convert';
// model
class MainServices {
  int id;
  String name;
  int show;
  String notes;

  MainServices({
    required this.id,
    required this.name,
    required this.show,
    required this.notes
  });
// `toJson` converts a UserModels object to a JSON representation.
// `fromJson` creates a UserModels object from a JSON map.

  factory MainServices.fromJson(Map<String, dynamic> json) => MainServices(
    id: json["id"],
    name: json["name"],
    show: json["show"],
    notes: json["notes"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "show": show,
    "notes": notes,
  };
}

List<MainServices> mainServicesModelsFromJson(String str) =>
    List<MainServices>.from(json.decode(str).map((x) => MainServices.fromJson(x)));

String mainServicesModelsToJson(List<MainServices> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
