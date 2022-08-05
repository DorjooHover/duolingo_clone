import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/themes/theme_constants.dart';

// percent indicator
import 'package:percent_indicator/linear_percent_indicator.dart';

class QuestionAppBar extends StatelessWidget {
  const QuestionAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _customText = Theme.of(context).textTheme;
    return AppBar(
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
    );
  }
}
