import 'dart:math';

import 'package:anchored_popups/anchored_popup_region.dart';
import 'package:anchored_popups/anchored_popups.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/questions/listening_question.dart';
import 'package:frontend/questions/selecting_question.dart';
import 'package:frontend/themes/theme_constants.dart';

class LessonCard extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnchoredPopups(
      child: LessonPopup(),
    );
  }
}

class LessonPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              AnchoredPopUpRegion(
                  mode: PopUpMode.clickToToggle,
                  anchor: Alignment.bottomCenter,
                  popAnchor: Alignment.center,
                  buttonBuilder: (_, child, show) {
                    return TextButton(child: child, onPressed: show);
                  },
                  // This is what is shown when the popup is opened:
                  popChild: Container(
                      height: 240,
                      alignment: Alignment.bottomCenter,
                      margin:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      decoration: BoxDecoration(
                          color: Color(0xFF3c4951),
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('assets/crown_transparent.png'),
                              Image.asset('assets/crown_transparent.png'),
                              Image.asset('assets/crown_transparent.png'),
                              Image.asset('assets/crown_transparent.png'),
                              Image.asset('assets/crown_transparent.png'),
                              Image.asset('assets/crown_transparent.png'),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Level 0/6',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Lesson 0/6',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                ],
                              ),
                              Container(
                                  width: 60,
                                  height: 60,
                                  alignment: Alignment.center,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF394451),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: BorderSide(
                                              color: Color(0xFF27343c),
                                              width: 2)),
                                    ),
                                    onPressed: () {},
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Transform.rotate(
                                        angle: -45,
                                        child: Icon(
                                          Icons.key,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ListeningQuestion(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: white,
                                shadowColor: iconGrey,
                                elevation: 5,
                                minimumSize: const Size.fromHeight(50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: Text(
                              'Start'.toUpperCase(),
                              style: TextStyle(
                                  color: Color(
                                    0xFF151e27,
                                  ),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ],

                        // Row(
                        //   children: [
                        //     Image.asset(
                        //       'assets/egg.png',
                        //       width: 40,
                        //     )
                        //   ],
                        // ),
                        // ListTile(
                        //     title: Text('Level 0/6'),
                        //     subtitle: Text('Lesson 0/6'),
                        //     trailing: RaisedButton(
                        //       onPressed: () {},
                        //       child: Text('Alphabet'),
                        //     )),
                        // Container(
                        //   child: ElevatedButton(
                        //       onPressed: () {},
                        //       child: Container(
                        //         child: Text('Start'),
                        //       )),
                        // )
                      )),
                  // The region that will activate the popup
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Transform.rotate(
                                  angle: 3 * pi / 4,
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.grey[300],
                                    value: Random().nextDouble(),
                                    valueColor: AlwaysStoppedAnimation(
                                        Colors.yellow[600]),
                                    strokeWidth: 60,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 42,
                                  ),
                                ),
                                CircleAvatar(
                                  child: Image.asset('assets/egg.png'),
                                  radius: 35,
                                  backgroundColor: Colors.purple[200],
                                )
                              ],
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/crown.png',
                                  height: 35,
                                ),
                                Text(
                                  '2',
                                  style: TextStyle(
                                      color: Colors.deepOrangeAccent,
                                      fontSize: 10),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Alphabet',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  )),
            ],
          ),
        )
      ],
    );
  }
}
