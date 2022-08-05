import 'dart:convert';

class LanguageModel {
  final String id;
  final String image;
  final String name;

  const LanguageModel(
      {required this.id, required this.image, required this.name});
  // id = json['_id'];
  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        id: json['_id'],
        image: json['image'],
        name: json['name'],
      );
}
// 