import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/screens/auth/seconscreen.dart';

class HearAbout extends StatefulWidget {
  const HearAbout({Key? key}) : super(key: key);

  @override
  State<HearAbout> createState() => _HearAboutState();
}

int activeIndex = -1;

class _HearAboutState extends State<HearAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF151e27),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: new IconButton(
              onPressed: () => {Navigator.pop(context)},
              icon: new Icon(Icons.arrow_back))),
      body: Text('asdf'),
      bottomNavigationBar: Container(
        height: 140,
        // padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    color: Color(
                      0xFF3c4951,
                    ),
                    width: 3))),
        child: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 30),
            // color: Colors.red,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondScreen()));
                },
                style: ElevatedButton.styleFrom(
                    // elevation: 20,
                    primary: activeIndex == -1
                        ? Color(0xFF394551)
                        : Color(0xFF96d232),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Text("Continue".toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: activeIndex == -1
                              ? Color(0xFF54656f)
                              : Color(0xFF151e27))),
                ))),
      ),
    );
  }
}
