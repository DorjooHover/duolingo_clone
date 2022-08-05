import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/screens/auth/chooseKnowledge.dart';
import 'package:frontend/screens/auth/owl-happy.dart';
import 'package:frontend/screens/auth/seconscreen.dart';
import 'package:frontend/screens/auth/signin.dart';

class ChooseLevel extends StatefulWidget {
  final String choseLanguage;
  final String choseHearAbout;
  final String choseKnowledge;

  const ChooseLevel(
      {Key? key,
      required this.choseLanguage,
      required this.choseHearAbout,
      required this.choseKnowledge})
      : super(key: key);

  @override
  State<ChooseLevel> createState() => _ChooseLevelState();
}

List<String> levels = [
  'learning French for the first time?',
  'Already know some French'
];
String choseLevel = '';
int activeIndex = -1;

class _ChooseLevelState extends State<ChooseLevel> {
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
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Help us find your level',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: ListView.builder(
                itemCount: levels.length,
                itemBuilder: (BuildContext context, int index) => Card(
                      color: Color(0xFF151e27),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                              color: index == activeIndex
                                  ? Color(0xFF5b879f)
                                  : Color(0xFF3c4951))),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: ListTile(
                          title: Text(
                            '${levels[index]}',
                            style: TextStyle(
                                color: index == activeIndex
                                    ? Color(0xFF3f95c7)
                                    : Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          // leading: Owlhappy(),
                          onTap: () {
                            setState(() {
                              activeIndex = index;
                              choseLevel = levels[index];
                            });
                          },
                        ),
                      ),
                    )),
          ))
        ],
      ),
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
                  if (choseLevel.isNotEmpty) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Signin(
                                choseLanguage: widget.choseLanguage,
                                choseHearAbout: widget.choseHearAbout,
                                choseKnowledge: widget.choseKnowledge,
                                choseLevel: choseLevel)));
                  }
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
