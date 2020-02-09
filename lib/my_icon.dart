import 'package:flutter/material.dart';

class MyIcon extends StatelessWidget {
  final double height;
  final double width;

  const MyIcon({Key key, @required this.height, @required this.width})
      : super(key: key);

  factory MyIcon.square({@required double size}) => MyIcon(
        height: size,
        width: size,
      );

  factory MyIcon.maxSize() => MyIcon(
        width: null,
        height: null,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Colors.lightGreenAccent,
      padding: EdgeInsets.all(4),
      child: Image.asset(
        'images/icon.png',
      ),
    );
  }
}
