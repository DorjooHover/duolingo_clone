import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/screens/auth/chooseLanguage.dart';
import 'package:frontend/screens/auth/seconscreen.dart';

class AuthIndex extends StatefulWidget {
  const AuthIndex({Key? key}) : super(key: key);

  @override
  State<AuthIndex> createState() => _AuthIndexState();
}

class _AuthIndexState extends State<AuthIndex> {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Color(0xFF151e27),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF151e27),
          automaticallyImplyLeading: false,
          leading: new IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: new Icon(Icons.arrow_back))),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Already have an account',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Pick up where you left off.',
                      style: TextStyle(color: Colors.white)),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10),
                          ),
                          primary: Color(0xFF96d232),
                          minimumSize: const Size.fromHeight(0)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChooseLanguage()));
                      },
                      child: Text(
                        'sign in'.toUpperCase(),
                        style: TextStyle(
                            color: Color(0xFF001204),
                            fontWeight: FontWeight.w800),
                      )),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
          Divider(
              height: 20,
              thickness: 2,
              indent: 10,
              endIndent: 20,
              color: Color(0xFF25323a)),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'New to Duolingo?',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Start learning a language now.',
                      style: TextStyle(color: Colors.white)),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10),
                              side: BorderSide(
                                  color: Color(0xFF25323a), width: 3)),
                          primary: Color(0xFF151e27),
                          minimumSize: const Size.fromHeight(0)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChooseLanguage()));
                      },
                      child: Text(
                        'Get Started'.toUpperCase(),
                        style: TextStyle(
                            color: Color(0xFF96d232),
                            fontWeight: FontWeight.w800),
                      )),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          )
        ],
      )));
}
