import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/questions/selecting_question.dart';
import 'package:frontend/themes/theme_constants.dart';
import 'package:frontend/util/3d_button.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ListeningQuestion extends StatefulWidget {
  const ListeningQuestion({Key? key}) : super(key: key);

  @override
  State<ListeningQuestion> createState() => _ListeningQuestionState();
}

double _audio = 6;
double _check = 60;
int activeIndex = -1;
bool correct = false;

class _ListeningQuestionState extends State<ListeningQuestion> {
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
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Question Guide
            Text("Select what you hear", style: _customText.headline3),

            Material(
              color: mainBg,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Center(
                  child: GestureDetector(
                    onTapDown: (_) => setState(() {
                      _audio = 0;
                    }),
                    onTapUp: (_) => setState(() {
                      _audio = 6;
                    }),
                    child: AnimatedContainer(
                      padding: EdgeInsets.only(bottom: _audio),
                      decoration: BoxDecoration(
                        color: waterShadowBlue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      duration: const Duration(milliseconds: 0),
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: waterBlue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                          icon: Transform.translate(
                            offset: Offset(-15, -15),
                            child: const Icon(
                              Icons.volume_up_sharp,
                              color: mainBg,
                              size: 60,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Anwers
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 7 / 5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 15),
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (BuildContext ctx, index) {
                return Container(
                  padding: EdgeInsets.only(bottom: 2),
                  decoration: BoxDecoration(
                      color: activeIndex == index
                          ? correct
                              ? mainGreen
                              : waterBlue
                          : mainGrey,
                      // border:
                      //     Border(bottom: BorderSide(color: mainGrey, width: 2)),
                      borderRadius: BorderRadius.circular(15)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: mainBg,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: activeIndex == index
                                    ? correct
                                        ? mainGreen
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
                      "sensei",
                      style: _customText.headline3,
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Center(
                child: Text(
                  "CAN'T LISTEN NOW",
                  style: _customText.caption,
                ),
              ),
            ),
            PushableButton(
              onPress: () {
                if (correct) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectingQuestion(),
                    ),
                  );
                }
                setState(() {
                  correct = true;
                });
              },
              title: correct ? 'CONTINUE' : "CHECK",
              bodyColor: activeIndex > -1 ? mainGreen : mainGrey,
              shadowColor: activeIndex > -1 ? shadowGreen : mainBg,
            )
          ],
        ),
      ),
    );
  }
}
