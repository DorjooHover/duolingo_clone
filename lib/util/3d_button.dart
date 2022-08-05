import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/themes/theme_constants.dart';

class PushableButton extends StatefulWidget {
  final VoidCallback onPress;
  final String title;
  final Color bodyColor;
  final Color shadowColor;
  // const PushableButton({Key? key, required this.onPress}) : super(key: key);
  PushableButton(
      {Key? key,
      required this.onPress,
      required this.title,
      required this.bodyColor,
      required this.shadowColor})
      : super(key: key);
  @override
  State<PushableButton> createState() => PushableButtonState();
}

class PushableButtonState extends State<PushableButton> {
  static const double _shadowHeight = 4;
  double _position = 4;

  @override
  Widget build(BuildContext context) {
    // Button full width
    double width = MediaQuery.of(context).size.width;
    final double _height = 50 - _shadowHeight;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
        ),
        child: Center(
          child: GestureDetector(
            onTapUp: (_) {
              setState(() {
                _position = 4;
              });
            },
            onTapDown: (_) {
              setState(() {
                _position = 0;
              });
            },
            onTapCancel: () {
              setState(() {
                _position = 4;
              });
            },
            child: Container(
              height: _height + _shadowHeight,
              width: width - 40,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: _height,
                      width: width - 40,
                      decoration: BoxDecoration(
                        color: widget.shadowColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    curve: Curves.easeIn,
                    bottom: _position,
                    duration: Duration(milliseconds: 0),
                    child: Container(
                      height: _height,
                      width: width - 40,
                      decoration: BoxDecoration(
                        color: widget.bodyColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: widget.bodyColor,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            minimumSize: Size.fromHeight(20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                                // side: BorderSide
                                ),
                          ),
                          // onPressed: () {
                          //   // Navigator.push(
                          //   //   context,
                          //   //   PageTransition(
                          //   //     type: PageTransitionType.rightToLeftJoined,
                          //   //     child: SelectingQuestion(),
                          //   //     childCurrent: ListeningQuestion(),
                          //   //     isIos: true,
                          //   //     duration: Duration(milliseconds: 400),
                          //   //   ),
                          //   // );
                          // },
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color: mainBg,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: widget.onPress,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
