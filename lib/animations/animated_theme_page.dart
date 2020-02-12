import 'package:animations/animations/base.dart';
import 'package:flutter/material.dart';

class AnimatedThemePage extends StatefulWidget implements AnimationPageBase {
  @override
  _AnimatedThemePageState createState() => _AnimatedThemePageState();

  @override
  String get name => 'animated theme';
}

class _AnimatedThemePageState extends State<AnimatedThemePage> {
  var _isLightTheme = true;

  @override
  Widget build(BuildContext context) {
    return AnimationPageScaffold(
      title: widget.name,
      action: () {
        setState(() {
          _isLightTheme = !_isLightTheme;
        });
      },
      body: Center(
        child: AnimatedTheme(
          data: _isLightTheme ? ThemeData.light() : ThemeData.dark(),
          duration: const Duration(milliseconds: 500),
          child: Card(
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'hello',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          curve: Curves.slowMiddle,
        ),
      ),
    );
  }
}
