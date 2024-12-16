// To parse this JSON data, do
//
//     final datamodel = datamodelFromJson(jsonString);

import 'dart:convert';

List<Datamodel> datamodelFromJson(String str) => List<Datamodel>.from(json.decode(str).map((x) => Datamodel.fromJson(x)));

String datamodelToJson(List<Datamodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Datamodel {
  int userId;
  int id;
  String title;
  String body;

  Datamodel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Datamodel.fromJson(Map<String, dynamic> json) => Datamodel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
