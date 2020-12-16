import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/CupertinoNavBar.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);
  SearchBase createState() => SearchBase();
}

class SearchBase extends State<Search> {
  Widget _buildSearchTextField() {
    return CupertinoTextField(
      padding: EdgeInsets.only(bottom: 4, top: 4, left: 10, right: 10),
      placeholder: '请输入', // 输入提示
      placeholderStyle: TextStyle(fontSize: 14, color: Color(0xff999999)),
      style: TextStyle(color: Color(0xff666666), fontSize: 14),
      decoration: BoxDecoration(
        // 文本框装饰
        color: Color(0xfff5f5f5), // 文本框颜色
        border: Border.all(color: Color(0xffaaaaaa), width: 1), // 输入框边框
        borderRadius: BorderRadius.all(Radius.circular(40)), // 输入框圆角设置
      ),
    );
  }

  Widget _buildKeyWordsWidget() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
              color: Color(0xfff1f1f1),
              child: GestureDetector(
                child: Text(
                  '迪卡侬自行车',
                  style: TextStyle(color: Color(0xff666666), fontSize: 12),
                ),
                onTap: () {},
              )),
          Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
              color: Color(0xfff1f1f1),
              child: GestureDetector(
                child: Text(
                  '香奈儿',
                  style: TextStyle(color: Color(0xff666666), fontSize: 12),
                ),
                onTap: () {},
              ))
        ],
      ),
    );
  }

  Widget build(context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavBar(
        heroTag: "Serach",
        actionsForegroundColor: Color(0xfff000000),
        middle: _buildSearchTextField(),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text(
            '搜索',
            style: TextStyle(fontSize: 16),
          ),
          onPressed: () {},
        ),
      ),
      child: Container(
        child: ListView(
          children: [_buildKeyWordsWidget()],
        ),
      ),
    );
  }
}
