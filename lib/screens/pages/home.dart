import 'dart:math';

import 'package:anchored_popups/anchored_popup_region.dart';
import 'package:anchored_popups/anchored_popups.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/screens/pages/bottom_navbar.dart';
import 'package:frontend/screens/pages/lesson.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // clipBehavior: Clip.none,
      children: [
        LessonCard()

        // )
      ],
    );
  }
}

// class LessonCard extends StatelessWidget {
//   const LessonCard(
//       {Key? key,
//       required this.image,
//       required this.number,
//       required this.title,
//       required this.color})
//       : super(key: key);
//   final String image;
//   final String number;
//   final String title;
//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return AnchoredPopUpRegion(
//         // onTap: () {
//         //   Navigator.of(context).push(
//         //     MaterialPageRoute(
//         //       builder: (context) => Center(
//         //         child: LessonPopupCard(),
//         //       ),
//         //     ),
//         //   );
//         // },
//         // offset: Offset(, 200),
//         mode: PopUpMode.clickToToggle,
//         popAnchor: Alignment.topCenter,
//         popChild: Text('asdf'),
//         buttonBuilder: (_, child, show) {
//           return TextButton(onPressed: show, child: child);
//         },
//         child: Column(
//           children: [
//             Stack(
//               // fit: StackFit.expand,
//               // clipBehavior: Clip.antiAliasWithSaveLayer,
//               alignment: Alignment.bottomRight,
//               children: [
//                 Stack(
//                   // fit: StackFit.expand,
//                   alignment: Alignment.center,
//                   children: [
//                     Transform.rotate(
//                       angle: 3 * pi / 4,
//                       child: CircularProgressIndicator(
//                         backgroundColor: Colors.grey[300],
//                         value: Random().nextDouble(),
//                         valueColor: AlwaysStoppedAnimation(Colors.yellow[600]),
//                         strokeWidth: 60,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: 42,
//                       ),
//                     ),
//                     CircleAvatar(
//                       child: Image.asset(
//                         image,
//                         height: 50,
//                       ),
//                       radius: 35,
//                       backgroundColor: color,
//                     )
//                   ],
//                 ),
//                 Stack(
//                   alignment: Alignment.center,
//                   children: <Widget>[
//                     Image.asset(
//                       'assets/crown.png',
//                       height: 40,
//                     ),
//                     Text(
//                       number,
//                       style: TextStyle(
//                           color: Colors.deepOrangeAccent, fontSize: 10),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               title,
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                   color: Colors.white),
//             )
//           ],
//         ));
//   }
// }

// // Widget twoLessonWidget(Widget lesson1, Widget lesson2) {
// //   return Row(
// //     mainAxisAlignment: MainAxisAlignment.center,
// //     children: [
// //       AnchoredPopups(child: lesson1),
// //       SizedBox(
// //         width: 20,
// //       ),
// //       AnchoredPopups(child: lesson2)
// //     ],
// //   );
// // }
