import 'package:flutter/material.dart';

abstract class AnimationPageBase extends Widget implements WithName {}

mixin WithName {
  String get name;
}

class AnimationPageScaffold extends StatelessWidget {
  final String title;
  final VoidCallback action;
  final Widget body;

  const AnimationPageScaffold({
    Key key,
    @required this.title,
    @required this.action,
    @required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(this.title),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.play_arrow,
          color: Colors.white,
        ),
        onPressed: action,
      ),
      body: body,
    );
  }
}
