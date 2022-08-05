import 'package:flutter/material.dart';
import 'package:frontend/bars/home_appbar.dart';
import 'package:frontend/bars/profile.appbar.dart';

import 'package:frontend/screens/auth/index.dart';

import 'package:frontend/screens/pages/lesson.dart';
import 'package:frontend/screens/pages/profile.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  GoogleSignInAccount? _currentUser;

  int _selectedIndex = 0;
  final _appbars = <PreferredSizeWidget>[
    HomeAppBar(),
    ProfileAppBar(),
    ProfileAppBar(),
    ProfileAppBar(),
    ProfileAppBar(),
  ];
  final _screens = [
    LessonCard(),
    Profile(),
    Profile(),
    Profile(),
    Profile(),
  ];

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _currentUser;
    var mainGrey = Color(0xFF39454f);

    if (user != null) {
      return Scaffold(
        appBar: _appbars[_selectedIndex],
        body: _screens[_selectedIndex],
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(
            top: 10,
          ),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 2, color: mainGrey),
            ),
          ),
          child: BottomNavigationBar(
            backgroundColor: Color(0xFF151e27),

            // Icon Size
            selectedIconTheme: IconThemeData(size: 30),
            unselectedIconTheme: IconThemeData(size: 30),

            // Navbar Text Color
            unselectedItemColor: mainGrey,
            selectedItemColor: mainGrey,

            // Label hide
            showSelectedLabels: false,
            showUnselectedLabels: false,

            currentIndex: _selectedIndex,
            onTap: (i) => setState(() {
              _selectedIndex = i;
            }),
            type: BottomNavigationBarType.fixed,
            items: const [
              //  Home
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "",
              ),

              // Short button
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/a.png'),
                ),
                label: "",
              ),

              // Add Button
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/duolingo-book.png'),
                ),
                label: "",
              ),

              // Subsciption button
              BottomNavigationBarItem(
                icon: Icon(Icons.shield_outlined),
                label: "Shield",
              ),

              // Library Button
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/profile_rounded.png'),
                ),
                label: "",
              ),
            ],
          ),
        ),
      );
    } else {
      return AuthIndex();
    }
  }
}
