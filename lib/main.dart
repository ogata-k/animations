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
    List<Widget> _animationPages = List<Widget>.generate(
      30,
      (i) => ListTile(
        leading: Image.asset('images/icon.png'),
        title: Text('animation$i'),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('animations'),
        centerTitle: true,
      ),
      body: Scrollbar(
        child: ListView.separated(
          separatorBuilder: (context, i) => Divider(),
          itemCount: _animationPages.length,
          itemBuilder: (context, i) => _animationPages[i],
        ),
      ),
    );
  }
}
