import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/models/user.model.dart';
import 'package:frontend/screens/auth/girl.dart';
import 'package:frontend/screens/auth/owl-happy.dart';
import 'package:frontend/services/user.service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _ProfileState();
  }
}

List<String> achievements = ['Scholar', 'Champion', 'Challanger'];

class _ProfileState extends StatelessWidget {
  final List<UserModel> _user = [];
  @override
  void initState() {
    // fetchUser(widget.email).then((value) {
    //   setState(() {
    //     _user.addAll(value);
    //   });
    // print(_user);
    // });
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFF3c4951), width: 2),
                    top: BorderSide(color: Color(0xFF3c4951), width: 2))),
            child: ListTile(
              textColor: Colors.white,
              // leading: FittedBox(
              //   fit: BoxFit.contain,
              //   child: CircleAvatar(
              //     backgroundImage: NetworkImage(_user[0].image),
              //     // radius: 80,

              //     minRadius: 70,
              //     maxRadius: 100,
              //   ),
              // ),
              // title: Text(
              //   _user[0].name,
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              // ),
              subtitle: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.lock_clock,
                        color: Color(0xFF3c4951),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Joined July 2022')
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        onPressed: () {
                          print('signout');
                          _googleSignIn.signOut();
                        },
                        child: Icon(
                          Icons.flag,
                          size: 24,
                          color: Colors.white,
                        ),
                      )
                      // Icon(
                      //   Icons.flag,
                      //   size: 24,
                      //   color: Colors.white,
                      // ),
                      )
                ],
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Statistics',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: 4,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          // crossAxisSpacing: 2,
                          childAspectRatio: 2,
                          // mainAxisSpacing: 2
                        ),
                        itemBuilder: (_, int index) {
                          return GridTile(
                              child: Card(
                                  color: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                          color: Color(0xFF3c4951), width: 2)),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        alignment: Alignment.centerLeft,
                                        primary: Colors.transparent,
                                        elevation: 0),
                                    onPressed: () {},
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      horizontalTitleGap: 0,
                                      leading: Image(
                                        image: NetworkImage(
                                          'https://scontent.fuln6-1.fna.fbcdn.net/v/t1.6435-9/89305572_220837662374483_4643899669011759104_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=MLIhEAyiIRMAX9moldW&_nc_oc=AQmkvLI9jc8W_3D0nZJp9g1t7fIeGFxKMln_D8w7TlyZMZWl8lBfR0XJnyXGQ4oWvxQ&_nc_ht=scontent.fuln6-1.fna&oh=00_AT9Lf6KlERj86SafrPNMA9Xqgjhtbn1cmFtnf42FTM8twg&oe=630EA8E8',
                                        ),
                                        width: 20,
                                      ),
                                      title: Text(
                                        '1',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        'Day streak',
                                        style:
                                            TextStyle(color: Color(0xFF3c4951)),
                                      ),
                                    ),
                                  )));
                        },
                      )
                    ],
                  )
                ],
              )),
          SizedBox(
            width: 20,
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Achievements',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: ListView.builder(
                          itemCount: achievements.length - 1,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) =>
                              Card(
                                margin: EdgeInsets.zero,
                                color: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: index == 0
                                            ? Radius.circular(20)
                                            : Radius.circular(0)),
                                    side: BorderSide(color: Color(0xFF3c4951))),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: ListTile(
                                      title: Text(
                                        '${achievements[index]}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // leading: Girl(width: 100, height: 100),
                                      subtitle: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Earn 40px asdfasdfjklasdjfklasdjklf',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          LinearPercentIndicator(
                                            animation: true,
                                            animationDuration: 2000,
                                            lineHeight: 20,
                                            backgroundColor: Color(0xFF3c4951),
                                            barRadius: Radius.circular(20),
                                            progressColor: Color(0xFFfdd336),
                                            percent: 0.1,
                                          )
                                        ],
                                      )),
                                ),
                              )),
                    ),
                    Card(
                      margin: EdgeInsets.zero,
                      elevation: 0,
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20)),
                          side: BorderSide(color: Color(0xFF3c4951))),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: ListTile(
                          title: Text(
                            'View 8 more',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF3c4951),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
