import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../src/pages/Home.dart';
import '../src/pages/Cart.dart';
import '../src/pages/Categroy.dart';
import '../src/pages/Mine.dart';

class AppPage extends StatefulWidget {
  AppPage({Key key}) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  /*
   * 页面List
   */
  List _pages = [Home(), Categroy(), Cart(), Mine()];
  /*
   * 当前页面index
   */
  int _tabindex = 0;
  /*
   * 底部菜单列表 
  */
  List _bottomBarList = [
    {"title": "首页", "icon": Icon(IconData(0xe6b8, fontFamily: 'Tbicon'))},
    {"title": "分类", "icon": Icon(IconData(0xe682, fontFamily: 'Tbicon'))},
    {"title": "购物车", "icon": Icon(IconData(0xe6cd, fontFamily: 'Tbicon'))},
    {"title": "我的", "icon": Icon(IconData(0xe736, fontFamily: 'Tbicon'))},
  ];
  /*
   * tab点击事件
   */
  void _clickTabEvent(index) {
    if (mounted) {
      setState(() {
        this._tabindex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Color(0xfff000000),
        onTap: _clickTabEvent,
        items: this._bottomBarList.asMap().keys.map((ele) {
          return BottomNavigationBarItem(
              icon: this._bottomBarList[ele]['icon'],
              label: this._bottomBarList[ele]['title']);
        }).toList(),
      ),
      tabBuilder: (context, index) {
        return this._pages[this._tabindex];
      },
    );
  }
}
