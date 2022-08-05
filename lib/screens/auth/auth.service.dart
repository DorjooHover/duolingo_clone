import 'dart:convert';

import 'package:frontend/screens/auth/auth.model.dart';
import 'package:frontend/screens/auth/hearAbout.dart';
import 'package:http/http.dart' as http;
import 'package:universal_platform/universal_platform.dart';

class AuthService {
  // String url = 'localhost:3000/auth/signup';
  // String userUrl = 'http://localhost:3000/user/signup';
  // final host = UniversalPlatform.isAndroid ? '10.0.2.2' : '127.0.0.1';
  final url = Uri.parse('http://192.168.1.12:3000/auth/signup');
  Future<bool> signin(
      String name,
      String email,
      String image,
      String choseLanguage,
      String choseHearAbout,
      String choseKnowledge,
      String choseLevel,
      String age) async {
    print(jsonEncode(
      {
        'email': email,
        'name': name,
        'image': image,
        'hearAbout': choseHearAbout,
        'knowledge': choseKnowledge,
        'level': choseLevel,
        'age': age,
        'languages': [
          {'public_id': choseLanguage}
        ]
      },
    ));

    final http.Response response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
          {
            'email': email,
            'name': name,
            'image': image,
            'hearAbout': choseHearAbout,
            'knowledge': choseKnowledge,
            'level': choseLevel,
            'age': age,
            'languages': [
              {'public_id': choseLanguage}
            ]
          },
        ));
    return (response.statusCode == 200 || response.statusCode == 201);
  }
}
