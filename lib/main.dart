import 'dart:math';

import 'package:animations/animations/animated_align_page.dart';
import 'package:animations/animations/animated_container_page.dart';
import 'package:animations/animations/animated_default_text_style_page.dart';
import 'package:animations/animations/base.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimationListScreen(),
    );
  }
}

class AnimationListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 確認可能なアニメーションの一覧
    final List<Widget> _animationPages = <Widget>[
      AnimatedAlignPage(),
      AnimatedContainerPage(),
      AnimatedDefaultTextStylePage(),
    ];

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('animations'),
        centerTitle: true,
      ),
      body: Scrollbar(
        child: ListView.separated(
          separatorBuilder: (context, i) => Divider(height: 2),
          itemCount: _animationPages.length,
          itemBuilder: (context, i) =>
              _buildListItem(context, _animationPages[i]),
        ),
      ),
    );
  }
}

Widget _buildListItem(BuildContext context, AnimationPageBase animationPage) {
  final _theme = Theme.of(context);
  final _random = Random.secure();

  return Container(
    color: Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    ),
    child: Container(
      margin: EdgeInsets.only(left: 8),
      padding: EdgeInsets.all(8),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Text(
              animationPage.name,
              style: _theme.textTheme.title,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          IconButton(
            iconSize: 36,
            icon: Icon(Icons.play_circle_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return animationPage;
                  },
                  fullscreenDialog: true,
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}
