import 'dart:convert' as convert;

import 'package:frontend/models/user.model.dart';
import 'package:http/http.dart' as http;

String url = 'http://192.168.1.12:3000';

Future<List<UserModel>> fetchUser(String email) async {
  print(email);
  print(Uri.parse(url + '/user/view/' + email));
  await Future.delayed(Duration(seconds: 2));
  final response = await http.get(Uri.parse(url + '/user/view/' + email));
  print(response.body);

  // List<UserModel> _user = [];
  if (response.statusCode == 200) {
    Iterable list = convert.json.decode(response.body);
    return list.map((i) => UserModel.fromJson(i)).toList();
  } else {
    throw Exception('Failed to load user');
  }
}
