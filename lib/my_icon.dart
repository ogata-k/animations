import 'package:flutter/material.dart';

class MyIcon extends StatelessWidget {
  final double height;
  final double width;

  const MyIcon({Key key, @required this.height, @required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Colors.lightGreenAccent,
      child: Center(
        child: Image.asset(
          'images/icon.png',
          height: height - 8,
          width: width - 8,
        ),
      ),
    );
  }
}
