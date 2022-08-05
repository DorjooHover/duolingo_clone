import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/screens/auth/chooseLevel.dart';
import 'package:frontend/screens/auth/hearAbout.dart';
import 'package:frontend/screens/auth/seconscreen.dart';

class ChooseKnowledge extends StatefulWidget {
  final String choseLanguage;
  final String choseHearAbout;
  const ChooseKnowledge(
      {Key? key, required this.choseLanguage, required this.choseHearAbout})
      : super(key: key);

  @override
  State<ChooseKnowledge> createState() => _ChooseKnowledgeState();
}

String choseKnowledge = '';
int activeIndex = -1;
List<String> knowledges = [
  'I know a few words at most',
  'I can have simple conversations',
  'I am intermediate or higher'
];

class _ChooseKnowledgeState extends State<ChooseKnowledge> {
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
            child: const Text(
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
                  itemCount: knowledges.length,
                  itemBuilder: (BuildContext context, int index) => Card(
                    margin: EdgeInsets.all(0),
                    color: Color(0xFF151e27),
                    // padding: EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: index == 0
                                ? Radius.circular(20)
                                : Radius.circular(0),
                            bottom: index == knowledges.length - 1
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
                          '${knowledges[index]}',
                          style: TextStyle(
                              color: index == activeIndex
                                  ? Color(0xFF3f95c7)
                                  : Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text('$index'),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            'assets/india.png',
                            width: 45,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            activeIndex = index;
                            choseKnowledge = knowledges[index];
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
                  if (choseKnowledge.isNotEmpty) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChooseLevel(
                                choseLanguage: widget.choseLanguage,
                                choseHearAbout: widget.choseHearAbout,
                                choseKnowledge: choseKnowledge)));
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
