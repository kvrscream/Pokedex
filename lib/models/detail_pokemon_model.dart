import 'dart:convert';

class DetailPokemnonModel {
  final int? id;
  final String? name;

  DetailPokemnonModel({this.id, this.name});

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
  factory DetailPokemnonModel.fromMap(Map<String, dynamic> map) {
    return DetailPokemnonModel(id: map["id"], name: map["name"]);
  }

  factory DetailPokemnonModel.fromJson(String json) =>
      DetailPokemnonModel.fromMap(jsonDecode(json));
}
