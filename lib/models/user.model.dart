import 'package:flutter/material.dart';

class UserModel {
  final String name;
  final String id;
  final List<String> languages;
  final String email;
  final int heart;
  final String image;
  final String createdAt;

  const UserModel(
      {required this.id,
      required this.name,
      required this.languages,
      required this.email,
      required this.heart,
      required this.image,
      required this.createdAt});
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json['_id'],
      image: json['image'],
      name: json['name'],
      email: json['email'],
      languages: json['languages'],
      heart: json['heart'],
      createdAt: json['createdAt']);
}
