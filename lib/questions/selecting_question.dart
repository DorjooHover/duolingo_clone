import 'package:flutter/material.dart';
import 'package:frontend/questions/matching_question.dart';
import 'package:frontend/themes/theme_constants.dart';
import 'package:frontend/util/3d_button.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SelectingQuestion extends StatefulWidget {
  const SelectingQuestion({Key? key}) : super(key: key);

  @override
  State<SelectingQuestion> createState() => _SelectingQuestionState();
}

int activeIndex = -1;
bool correct = false;
bool check = false;

class _SelectingQuestionState extends State<SelectingQuestion> {
  static const double _shadowHeight = 4;

  double _position = 4;
  @override
  Widget build(BuildContext context) {
    // Full width Button
    double width = MediaQuery.of(context).size.width;

    // Texttheme
    TextTheme _customText = Theme.of(context).textTheme;
    final double _height = 50 - _shadowHeight;
    return Scaffold(
      backgroundColor: mainBg,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: mainBg,
        elevation: 0,
        leading: const Icon(
          Icons.settings_outlined,
          color: iconGrey,
        ),
        title: Container(
          child: LinearPercentIndicator(
            width: 175,
            lineHeight: 15.0,
            percent: 0.2,
            progressColor: mainGreen,
            barRadius: Radius.circular(10),
            backgroundColor: mainGrey,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                const Icon(
                  Icons.heart_broken,
                  color: heartRed,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text("5", style: _customText.bodyText1),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Question Guide
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Select the correct", style: _customText.headline3),
                SizedBox(
                  height: 15,
                ),
                Text("character's' for 'せんせい'", style: _customText.headline3),
              ],
            ),

            // Anwers
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 4 / 5,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (BuildContext ctx, index) {
                return Container(
                  padding: EdgeInsets.only(bottom: 2),
                  decoration: BoxDecoration(
                      color: activeIndex == index
                          ? check
                              ? correct
                                  ? mainGreen
                                  : Color(0xFFB33F36)
                              : waterBlue
                          : mainGrey,
                      // border:
                      //     Border(bottom: BorderSide(color: mainGrey, width: 2)),
                      borderRadius: BorderRadius.circular(15)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(bottom: 2),
                        primary: mainBg,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: activeIndex == index
                                    ? check
                                        ? correct
                                            ? mainGreen
                                            : heartRed
                                        : waterBlue
                                    : mainGrey,
                                width: 2),
                            borderRadius: BorderRadius.circular(15)),
                        alignment: Alignment.center),
                    onPressed: () {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                    child: Text(
                      "ア",
                      style: _customText.headline2,
                    ),
                  ),
                );
              },
            ),
            PushableButton(
              onPress: () {
                if (check) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MatchingQuestion(),
                    ),
                  );
                }
                setState(() {
                  if (activeIndex == 0) {
                    correct = true;
                  }
                  check = true;
                });
              },
              title: check
                  ? correct
                      ? 'CONTINUE'
                      : 'WRONG'
                  : "CHECK",
              bodyColor: check
                  ? correct
                      ? mainGreen
                      : heartRed
                  : mainGrey,
              shadowColor: check
                  ? correct
                      ? shadowGreen
                      : Color(0xFFB33F36)
                  : mainBg,
            )
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 5.0),
            //   child: Center(
            //     child: GestureDetector(
            //       onTapUp: (_) {
            //         setState(() {
            //           _position = 4;
            //         });
            //       },
            //       onTapDown: (_) {
            //         setState(() {
            //           _position = 0;
            //         });
            //       },
            //       onTapCancel: () {
            //         setState(() {
            //           _position = 4;
            //         });
            //       },
            //       child: Container(
            //         height: _height + _shadowHeight,
            //         width: width - 40,
            //         child: Stack(
            //           children: [
            //             Positioned(
            //               bottom: 0,
            //               child: Container(
            //                 height: _height,
            //                 width: width - 40,
            //                 decoration: BoxDecoration(
            //                   color: shadowGreen,
            //                   borderRadius: BorderRadius.all(
            //                     Radius.circular(16),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //             AnimatedPositioned(
            //               curve: Curves.easeIn,
            //               bottom: _position,
            //               duration: Duration(milliseconds: 0),
            //               child: Container(
            //                 height: _height,
            //                 width: width - 40,
            //                 decoration: BoxDecoration(
            //                   color: mainGreen,
            //                   borderRadius: BorderRadius.all(
            //                     Radius.circular(16),
            //                   ),
            //                 ),
            //                 child: Center(
            //                   child: TextButton(
            //                     onPressed: () {
            //                       // Navigator.push(
            //                       //   context,
            //                       //   PageTransition(
            //                       //     type: PageTransitionType.rightToLeftJoined,
            //                       //     child: SelectingQuestion(),
            //                       //     childCurrent: ListeningQuestion(),
            //                       //     isIos: true,
            //                       //     duration: Duration(milliseconds: 400),
            //                       //   ),
            //                       // );
            //                       Navigator.push(
            //                         context,
            //                         MaterialPageRoute(
            //                           builder: (context) =>
            //                               const MatchingQuestion(),
            //                         ),
            //                       );
            //                     },
            //                     child: Text(
            //                       "CHECK",
            //                       style: TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         letterSpacing: 1,
            //                         color: mainBg,
            //                         fontSize: 16,
            //                         fontFamily: "MPLUSRounded1c",
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
