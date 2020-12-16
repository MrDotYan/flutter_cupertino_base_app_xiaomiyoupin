import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mine extends StatefulWidget {
  Mine({Key key}) : super(key: key);
  MineBase createState() => MineBase();
}

class MineBase extends State<Mine> {
  Widget build(context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        heroTag: "Mine",
        transitionBetweenRoutes: false,
        middle: Text('Mine'),
      ),
      child: Container(),
    );
  }
}
