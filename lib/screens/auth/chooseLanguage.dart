import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/screens/auth/hearAbout.dart';
import 'package:frontend/screens/auth/seconscreen.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({Key? key}) : super(key: key);

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  @override
  bool isHover = false;
  int i = -1;
  List<String> countries = [
    "India",
    "Canada",
    "Brazil",
    "USA",
    "Japan",
    "China",
    "UK",
    "Uganda",
    "Uruguay"
  ];

  int activeIndex = -1;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF151e27),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: new IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: new Icon(Icons.arrow_back)),
        // actions: [
        //   LinearProgressIndicator(
        //     value: 30,
        //     // semanticsValue: ,
        //     // color: Colors.brown,
        //   )
        // ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              alignment: Alignment.centerLeft,
              child: const Text(
                'I want learn...',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
          Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  child: ListView.builder(
                    itemCount: countries.length,
                    itemBuilder: (BuildContext context, int index) => Card(
                      margin: EdgeInsets.all(0),
                      color: Color(0xFF151e27),
                      // padding: EdgeInsets.all(5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: index == 0
                                  ? Radius.circular(20)
                                  : Radius.circular(0),
                              bottom: index == countries.length - 1
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
                            '${countries[index]}',
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
                            });
                          },
                        ),
                      ),
                    ),
                  )
                  // ),
                  )),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HearAbout()));
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
