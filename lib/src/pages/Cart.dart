import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  Cart({Key key}) : super(key: key);
  CartBase createState() => CartBase();
}

class CartBase extends State<Cart> {
  // 列表
  List<Map> _wrapList = [
    {"url": "lib/assets/image/shop5.png"},
    {"url": "lib/assets/image/shop6.jpg"},
    {"url": "lib/assets/image/shop5.png"},
    {"url": "lib/assets/image/shop6.jpg"},
    {"url": "lib/assets/image/shop5.png"},
    {"url": "lib/assets/image/shop6.jpg"},
    {"url": "lib/assets/image/shop5.png"},
    {"url": "lib/assets/image/shop6.jpg"},
    {"url": "lib/assets/image/shop5.png"},
  ];
  // 没数据或者没登陆
  Widget _buildNoRulest() {
    return Container(
      height: 260,
      child: Column(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Center(
                  child: Image.asset('lib/assets/image/no_result_cart.png',
                      width: 100, height: 100),
                ),
              ),
              Container(
                child: Text(
                  '你还没有登录哦',
                  style: TextStyle(fontSize: 14, color: Color(0xff666666)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: CupertinoButton(
                    color: Color.fromRGBO(191, 17, 17, 1),
                    padding: EdgeInsets.symmetric(
                      vertical: 0.0,
                      horizontal: 64.0,
                    ),
                    child: Text(
                      '去登录',
                      style: TextStyle(fontSize: 14),
                    ),
                    onPressed: () {}),
              )
            ],
          ),
        ],
      ),
    );
  }

  // 商品列表
  Widget _buildWrapForList() {
    double height = 160.0;
    double space = 15.0;
    return Padding(
      padding: EdgeInsets.all(10),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 10,
        spacing: 2,
        children: List<Widget>.from(this._wrapList.map((ele) {
          return Container(
            width: MediaQuery.of(context).size.width / 2 - space,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2 - space,
                  height: height,
                  child: Stack(
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.asset(
                            ele['url'],
                            fit: BoxFit.fitWidth,
                            width:
                                MediaQuery.of(context).size.width / 2 - space,
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 4, right: 4, top: 2, bottom: 2),
                                  color: Color(0xff67C23A),
                                  child: Text(
                                    '新品',
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xffffffff)),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 4, right: 4, top: 2, bottom: 2),
                                  color: Color(0xffff23448),
                                  child: Text(
                                    '热门',
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xffffffff)),
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(2),
                        child: Text(
                          '蓝牙balabala',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        child: Text(
                          '巴拉巴拉巴拉，巴拉巴拉巴拉，巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff999999)),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(2),
                                child: Text('￥23113.33',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffff0000)))),
                            Padding(
                                padding: EdgeInsets.all(2),
                                child: Text('￥23113.33',
                                    style: TextStyle(
                                        fontSize: 14,
                                        decoration: TextDecoration.lineThrough,
                                        color: Color(0xff666666)))),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        })),
      ),
    );
  }

// 标题
  Widget _buildWrapTitle() {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Center(
          child: Text('为你推荐',
              style: TextStyle(color: Color(0xff696969), fontSize: 22))),
    );
  }

  Widget build(context) {
    return CupertinoPageScaffold(
      child: Container(
        color: Color(0xfff5f5f5),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('购物车'),
              leading: Icon(
                IconData(0xe6af, fontFamily: "Tbicon"),
                color: Color(0xff666666),
              ),
              trailing: CupertinoButton(
                padding: EdgeInsets.zero,
                child: Text(
                  '编辑',
                  style: TextStyle(color: Color(0xff666666), fontSize: 14),
                ),
                onPressed: () {
                  print('9999');
                },
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                  [_buildNoRulest(), _buildWrapTitle(), _buildWrapForList()]),
            ),
          ],
        ),
      ),
    );
  }
}
