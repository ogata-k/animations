import 'package:animations/my_icon.dart';
import 'package:flutter/material.dart';

import 'base.dart';

class AnimatedAlignPage extends StatefulWidget implements AnimationPageBase {
  AnimatedAlignPage({Key key}) : super(key: key);

  @override
  _AnimatedAlignPageState createState() => _AnimatedAlignPageState();

  @override
  String get name => 'animated align';
}

class _AnimatedAlignPageState extends State<AnimatedAlignPage> {
  static const _alignments = [
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomRight,
    Alignment.bottomLeft,
  ];

  var _index = 0;
  static const _myIcon = MyIcon(
    height: 100,
    width: 100,
  );

  @override
  Widget build(BuildContext context) {
    return AnimationPageScaffold(
      title: widget.name,
      action: () {
        setState(() {
          _index += 1;
        });
      },
      body: AnimatedAlign(
        alignment: _alignments[_index % _alignments.length],
        duration: Duration(
          milliseconds: 500,
        ),
        child: _myIcon,
      ),
    );
  }
}
