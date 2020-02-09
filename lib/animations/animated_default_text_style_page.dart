import 'package:animations/animations/base.dart';
import 'package:flutter/material.dart';

class AnimatedDefaultTextStylePage extends StatefulWidget
    implements AnimationPageBase {
  AnimatedDefaultTextStylePage({Key key}) : super(key: key);

  @override
  _AnimatedDefaultTextStylePageState createState() =>
      _AnimatedDefaultTextStylePageState();

  @override
  String get name => 'animated default text style';
}

class _AnimatedDefaultTextStylePageState
    extends State<AnimatedDefaultTextStylePage> {
  var _index = 0;
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _styles = [
      _theme.textTheme.display1,
      _theme.textTheme.display2,
      _theme.textTheme.display3,
      _theme.textTheme.display4,
    ];

    return AnimationPageScaffold(
      title: widget.name,
      action: () {
        setState(() {
          _index += 1;
        });
      },
      body: Container(
        color: Colors.white,
        child: Center(
          child: AnimatedDefaultTextStyle(
            curve: Curves.linear,
            duration: const Duration(milliseconds: 500),
            style: _styles[_index % _styles.length],
            child: Text(
              'Flutter',
            ),
          ),
        ),
      ),
    );
  }
}
