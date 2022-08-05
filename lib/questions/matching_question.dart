import 'package:flutter/material.dart';
import 'package:frontend/themes/theme_constants.dart';
import 'package:frontend/util/3d_button.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MatchingQuestion extends StatefulWidget {
  const MatchingQuestion({Key? key}) : super(key: key);

  @override
  State<MatchingQuestion> createState() => _MatchingQuestionState();
}

int activeQuestionIndex = -1, activeIndexAnswer = -1, totalCorrectAnswer = 0;
bool checkQuestion = false,
    correctQuestion = false,
    checkAnswer = false,
    correctAnswer = false,
    correct = false,
    check = false;

class _MatchingQuestionState extends State<MatchingQuestion> {
  static const double _shadowHeight = 4;
  double _position = 4;
  @override
  Widget build(BuildContext context) {
    // Full width Button
    double width = MediaQuery.of(context).size.width;

    // Texttheme
    TextTheme _customText = Theme.of(context).textTheme;
    //
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Question Guide
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                "Tap the matching pairs",
                style: _customText.headline3,
              ),
            ),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 80,
                        childAspectRatio: 1 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 40,
                      ),
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext ctx, index) {
                        return Container(
                          padding: EdgeInsets.only(bottom: 2),
                          decoration: BoxDecoration(
                              color: activeQuestionIndex == index
                                  ? correctQuestion
                                      ? correctQuestion
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
                                        color: activeQuestionIndex == index
                                            ? correctQuestion
                                                ? correctQuestion
                                                    ? mainGreen
                                                    : heartRed
                                                : waterBlue
                                            : mainGrey,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(15)),
                                alignment: Alignment.center),
                            onPressed: () {
                              setState(() {
                                activeQuestionIndex = index;
                                if (activeIndexAnswer > -1 &&
                                    activeQuestionIndex > -1) {
                                  if (activeIndexAnswer == 0 &&
                                      activeQuestionIndex == 3) {
                                    correctAnswer = true;
                                    correctQuestion = true;
                                    totalCorrectAnswer += 1;
                                  }
                                }
                              });
                            },
                            child: Text(
                              "ア",
                              style: _customText.subtitle1,
                            ),
                          ),
                        );
                        // Container(
                        //   padding: EdgeInsets.only(bottom: 2),
                        //   decoration: BoxDecoration(
                        //     color: mainGrey,
                        //     borderRadius: BorderRadius.circular(15),
                        //   ),
                        //   child: Container(
                        //     alignment: Alignment.center,
                        //     padding: EdgeInsets.symmetric(
                        //       vertical: 10,
                        //     ),
                        //     decoration: BoxDecoration(
                        //       color: mainBg,
                        //       border: Border.all(
                        //         width: 2,
                        //         color: mainGrey,
                        //       ),
                        //       borderRadius: BorderRadius.circular(15),
                        //     ),
                        //     child: Text("ア", style: _customText.subtitle1),
                        //   ),
                        // );
                      },
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 80,
                        childAspectRatio: 1 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 40,
                      ),
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext ctx, index) {
                        return Container(
                          padding: EdgeInsets.only(bottom: 2),
                          decoration: BoxDecoration(
                              color: activeIndexAnswer == index
                                  ? correctQuestion
                                      ? correctAnswer
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
                                        color: activeIndexAnswer == index
                                            ? correctQuestion
                                                ? correctAnswer
                                                    ? mainGreen
                                                    : heartRed
                                                : waterBlue
                                            : mainGrey,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(15)),
                                alignment: Alignment.center),
                            onPressed: () {
                              setState(() {
                                activeIndexAnswer = index;
                                if (activeIndexAnswer > -1 &&
                                    activeQuestionIndex > -1) {
                                  if (activeIndexAnswer == 0 &&
                                      activeQuestionIndex == 3) {
                                    correctAnswer = true;
                                    correctQuestion = true;
                                    totalCorrectAnswer += 1;
                                  }
                                }
                              });
                            },
                            child: Text(
                              "ア",
                              style: _customText.subtitle1,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Anwersrow
            // GridView.builder(
            //   scrollDirection: Axis.horizontal,
            //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            //     maxCrossAxisExtent: 20,
            //     childAspectRatio: 2 / 1,
            //     crossAxisSpacing: 5,
            //     mainAxisSpacing: 5,
            //   ),
            //   itemCount: 2,
            //   shrinkWrap: true,
            //   itemBuilder: (BuildContext ctx, index) {
            //     return Container(
            //       padding: EdgeInsets.only(bottom: 2),
            //       decoration: BoxDecoration(
            //         color: mainGrey,
            //         borderRadius: BorderRadius.circular(15),
            //       ),
            //       child: Container(
            //         alignment: Alignment.center,
            //         padding: EdgeInsets.symmetric(
            //           vertical: 5,
            //         ),
            //         decoration: BoxDecoration(
            //           color: mainBg,
            //           border: Border.all(
            //             width: 2,
            //             color: mainGrey,
            //           ),
            //           borderRadius: BorderRadius.circular(15),
            //         ),
            //         child: Text("ア", style: _customText.subtitle1),
            //       ),
            //     );
            //   },
            // ),

            PushableButton(
              onPress: () {
                if (totalCorrectAnswer == 5) {
                  correct = true;
                }
              },
              title: "CHECK",
              bodyColor: mainGreen,
              shadowColor: shadowGreen,
            )
          ],
        ),
      ),
    );
  }
}
