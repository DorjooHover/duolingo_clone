import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/screens/auth/auth.controller.dart';
import 'package:frontend/screens/auth/seconscreen.dart';
import 'package:frontend/screens/pages/profile.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class Signin extends StatefulWidget {
  final String choseLanguage;
  final String choseHearAbout;
  final String choseKnowledge;
  final String choseLevel;

  const Signin(
      {Key? key,
      required this.choseLanguage,
      required this.choseHearAbout,
      required this.choseKnowledge,
      required this.choseLevel})
      : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

bool isLogin = false;

class _SigninState extends State<Signin> {
  GoogleSignInAccount? _currentUser;
  AuthController _controller = new AuthController();
  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  String age = '';
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _currentUser;
    if (user == null) {
      return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xFF151e27),
            automaticallyImplyLeading: false,
            leading: new IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: new Icon(Icons.arrow_back))),
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xFF151e27),
          ),
          padding: EdgeInsets.symmetric(horizontal: 40),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How old are you?',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xFF3c4951)),
                          color: Color(0xFF222f37)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      child: TextField(
                        onChanged: (value) {
                          age = value;
                        },
                        // style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: 'Age',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (age.isNotEmpty) {
                            signin();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF394551),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Container(
                            child: Center(
                          child: Text(
                            'next'.toUpperCase(),
                            style: TextStyle(
                                color: Color(0xFF50616b),
                                fontWeight: FontWeight.bold),
                          ),
                        )))
                  ],
                ),
              ),
              _buildWidget()
            ],
          ),
        ),
      );
    } else {
      return Profile();
    }
  }

  Widget _buildWidget() {
    GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ListTile(
              leading: GoogleUserCircleAvatar(identity: user),
              title: Text(user.displayName ?? ''),
              subtitle: Text(user.email),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Signed in successfully",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: signout, child: const Text('Sign out'))
          ],
        ),
      );
    } else {
      return
          // padding: const EdgeInsets.all(12.0),
          // margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              if (age.isNotEmpty) {
                signin();
              }
            },
            style: ElevatedButton.styleFrom(
                primary: Color(0xFF151e27),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xFF5b879f)),
                    borderRadius: BorderRadius.circular(10))),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.network(
                  'http://pngimg.com/uploads/google/google_PNG19635.png',
                  fit: BoxFit.cover,
                  height: 30,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('sign up with google'.toUpperCase())
              ]),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                    style: TextStyle(color: Colors.grey[400], fontSize: 13),
                    text: 'By signing in to Duolingo, you  agree to our ',
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'Terms ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      TextSpan(text: 'and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    ])),
          ),
          SizedBox(
            height: 10,
          )
        ],
      );
    }
  }

  void signout() {
    _googleSignIn.disconnect();
  }

  Future signin() async {
    try {
      await _googleSignIn.signIn().then((value) => {
            _controller.create(
                value!.displayName.toString(),
                value.email,
                value.photoUrl.toString(),
                widget.choseLanguage,
                widget.choseHearAbout,
                widget.choseKnowledge,
                widget.choseLevel,
                age)
          });
    } catch (e) {
      print('Error signin $e');
    }
  }
}
