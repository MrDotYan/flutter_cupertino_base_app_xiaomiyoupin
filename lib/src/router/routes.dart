import 'package:flutter/material.dart';
import '../App.dart';
import '../pages/Search.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => AppPage(),
  '/search': (context) => Search()
};
