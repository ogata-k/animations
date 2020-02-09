import 'package:animations/animations/base.dart';
import 'package:animations/my_icon.dart';
import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget
    implements AnimationPageBase {
  AnimatedContainerPage({Key key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();

  @override
  String get name => 'animated container';
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  static const _alignments = [
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomRight,
    Alignment.bottomLeft,
  ];

  static const _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

  var _index = 0;

  AlignmentGeometry get _alignment => _alignments[_index % _alignments.length];
  Color get _color => _colors[_index % _colors.length];

  final _myIcon = MyIcon.square(size: 100);

  @override
  Widget build(BuildContext context) {
    return AnimationPageScaffold(
      title: widget.name,
      action: () {
        setState(() {
          _index += 1;
        });
      },
      body: AnimatedContainer(
        alignment: _alignment,
        color: _color,
        margin: EdgeInsets.all(20 * ((3 - _index).toDouble() % 4)),
        padding: EdgeInsets.all(20 * (_index.toDouble() % 4)),
        duration: const Duration(milliseconds: 500),
        child: _myIcon,
        curve: Curves.easeInOut,
      ),
    );
  }
}
