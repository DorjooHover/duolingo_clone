import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/screens/auth/chooseKnowledge.dart';
import 'package:frontend/screens/auth/seconscreen.dart';

class HearAbout extends StatefulWidget {
  final String choseLanguage;

  const HearAbout({Key? key, required this.choseLanguage}) : super(key: key);

  @override
  State<HearAbout> createState() => _HearAboutState();
}

int activeIndex = -1;
List<String> hearAbout = [
  'App store',
  'Google Search',
  'News/article/blog',
  'YouTube',
  "TikTok"
];
String choseHearAbout = '';

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
      body: Column(children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            alignment: Alignment.centerLeft,
            child: Text(
              'How did you hear about Duolingo?',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )),
        Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: ListView.builder(
                  itemCount: hearAbout.length,
                  itemBuilder: (BuildContext context, int index) => Card(
                    margin: EdgeInsets.all(0),
                    color: Color(0xFF151e27),
                    // padding: EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: index == 0
                                ? Radius.circular(20)
                                : Radius.circular(0),
                            bottom: index == hearAbout.length - 1
                                ? Radius.circular(20)
                                : Radius.circular(0)),
                        side: BorderSide(
                            color: index == activeIndex
                                ? Color(0xFF5b879f)
                                : Color(0xFF3c4951),
                            width: 3)),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: ListTile(
                        title: Text(
                          '${hearAbout[index]}',
                          style: TextStyle(
                              color: index == activeIndex
                                  ? Color(0xFF3f95c7)
                                  : Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text('$index'),

                        onTap: () {
                          setState(() {
                            activeIndex = index;
                            choseHearAbout = hearAbout[index];
                          });
                        },
                      ),
                    ),
                  ),
                )
                // ),
                )),
      ]),
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
                  if (choseHearAbout.isNotEmpty) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChooseKnowledge(
                                choseLanguage: widget.choseLanguage,
                                choseHearAbout: choseHearAbout)));
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
