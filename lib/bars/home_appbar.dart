import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/themes/theme_constants.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF151e27),
      shape: Border(bottom: BorderSide(color: mainGrey, width: 2)),

      leading: IconButton(
        icon: Image.asset(
          "assets/japan_duolingo.png",
          width: 30,
        ),
        onPressed: () {},
      ),
      title: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              child: Row(
                children: [
                  Image.asset(
                    "assets/crown.png",
                    width: 30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "11",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onPressed: () {},
            ),
            TextButton(
              child: Row(
                children: [
                  Image.asset(
                    "assets/fire.png",
                    width: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "0",
                    style: TextStyle(
                        fontSize: 16,
                        color: mainGrey,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onPressed: () {},
            ),

            // Row(
            //   children: [
            //     IconButton(
            //       icon: Icon(Icons.car_crash),
            //       onPressed: () {},
            //     ),
            //     Text("0")
            //   ],
            // ),
            // Row(
            //   children: [
            //     IconButton(
            //       icon: Icon(Icons.car_crash),
            //       onPressed: () {},
            //     ),
            //     Text("0")
            //   ],
            // ),
          ],
        ),
      ),
      actions: [
        Row(
          children: [
            TextButton(
              child: Row(
                children: [
                  Image.asset(
                    "assets/heart.png",
                    width: 25,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "5",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ],
        )
      ],
      // title: Text("asdasd"),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
