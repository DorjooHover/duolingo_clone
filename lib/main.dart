import 'package:flutter/material.dart';

import 'package:frontend/screens/auth/index.dart';
import 'package:frontend/screens/auth/signin.dart';
import 'package:frontend/screens/pages/bottom_navbar.dart';
import 'package:frontend/screens/pages/home.dart';
import 'package:frontend/screens/pages/profile.dart';
import 'package:frontend/themes/theme_constants.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MyApp());
}

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  GoogleSignInAccount? _currentUser;
  // This widget is the root of your application.
  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      _currentUser = account;
    });
    _googleSignIn.signInSilently();
  }

  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _currentUser;
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: (user == null) ? const AuthIndex() : Profile());
  }
}
