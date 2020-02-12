import 'package:flutter/material.dart';

class MyIcon extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  const MyIcon(
      {Key key,
      @required this.height,
      @required this.width,
      this.color = Colors.lightGreenAccent})
      : super(key: key);

  factory MyIcon.square(
          {@required double size, Color color = Colors.lightGreenAccent}) =>
      MyIcon(
        height: size,
        width: size,
        color: color,
      );

  factory MyIcon.maxSize({Color color = Colors.lightGreenAccent}) => MyIcon(
        width: null,
        height: null,
        color: color,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
      padding: EdgeInsets.all(4),
      child: Image.asset(
        'images/icon.png',
      ),
    );
  }
}
