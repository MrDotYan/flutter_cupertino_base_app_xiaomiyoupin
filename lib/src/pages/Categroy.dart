import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Categroy extends StatefulWidget {
  Categroy({Key key}) : super(key: key);
  CategroyBase createState() => CategroyBase();
}

class CategroyBase extends State<Categroy> {
  // is to bottom;
  bool isToBottom = false;
  // childrenMEnu controller
  ScrollController _scrollController = new ScrollController();
  // 侧边栏菜单actived序号
  int _activeIndexSide = 0;
  // 侧边栏菜单
  List<Map> _sideMenuList = [
    {
      "name": "有品推荐",
    },
    {
      "name": "家用电器",
    },
    {
      "name": "居家餐厨",
    },
    {
      "name": "家具家装",
    },
    {
      "name": "电视影音",
    },
    {
      "name": "智能家庭",
    },
    {
      "name": "手机电脑",
    },
    {
      "name": "数码周边",
    },
    {
      "name": "日用文创",
    },
    {
      "name": "服装配饰",
    },
    {
      "name": "美妆个护",
    },
    {
      "name": "运动户外",
    },
    {
      "name": "鞋靴箱包",
    },
    {
      "name": "健康保健",
    },
    {
      "name": "美食酒饮",
    },
    {
      "name": "母婴亲子",
    },
    {
      "name": "出行车品",
    },
    {
      "name": "宠物生活",
    },
    {
      "name": "有品海购",
    },
    {
      "name": "DLAB",
    },
    {
      "name": "品牌墙",
    }
  ];

  // 子级菜单
  List<Map> _childrenMenuList = [
    {"name": "热卖爆款", "url": "lib/assets/image/shop6.png"},
    {"name": "温暖秋冬", "url": "lib/assets/image/shop7.png"},
    {"name": "热卖爆款", "url": "lib/assets/image/shop6.png"},
  ];

  // initState()
  @override
  void initState() {
    super.initState();
    this._scrollController
      ..addListener(() {
        this._sideMenuActiveAuto();
      });
  }

  // sideMenuAutoActive
  void _sideMenuActiveAuto() {
    if (!this.isToBottom) {
      if (this._scrollController.offset -
              this._scrollController.position.maxScrollExtent >=
          100) {
        if (mounted) {
          this.setState(() {
            this._activeIndexSide = this._activeIndexSide + 1;
            this.isToBottom = true;
          });
          Future.delayed(Duration(seconds: 3), () {
            if (mounted) {
              setState(() {
                this.isToBottom = false;
              });
            }
          });
        }
      }
    }
  }

  // 搜索
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

  Widget build(context) {
    double paddingValue = MediaQuery.of(context).padding.top + 44.0;
    double screenHeight = MediaQuery.of(context).size.height;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        heroTag: "Categroy",
        transitionBetweenRoutes: false,
        middle: _buildSearchTextField(),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text(
            '搜索',
            style: TextStyle(color: Color(0xff666666), fontSize: 14),
          ),
          onPressed: () {},
        ),
      ),
      child: Container(
          height: screenHeight,
          color: Color(0xfff5f5f5),
          margin: EdgeInsets.only(top: paddingValue, bottom: 44.0),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: _buildSideMenu(),
                flex: 1,
              ),
              Expanded(
                child: _buildSideChildrenMenu(),
                flex: 3,
              )
            ],
          )),
    );
  }

  Widget _buildBanner() {
    return Container(
      padding: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset('lib/assets/image/banner4.jpeg'),
      ),
    );
  }

  Widget _buildSideChildrenMenu() {
    return Container(
      color: Color(0xffffffff),
      child: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverList(delegate: SliverChildListDelegate([_buildBanner()])),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                padding:
                    EdgeInsets.only(top: 0, bottom: 10, left: 10, right: 10),
                child: Card(
                  margin: EdgeInsets.zero,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text('频道精选'),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Wrap(
                          spacing: 10,
                          runAlignment: WrapAlignment.center,
                          runSpacing: 10,
                          children: List<Widget>.from(
                              this._childrenMenuList.map((ele) {
                            return Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: Image.asset(
                                      ele['url'],
                                      width: 70,
                                      height: 70,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      ele['name'],
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff444444)),
                                    ),
                                  )
                                ],
                              ),
                            );
                          })),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }, childCount: 3),
          ),
        ],
      ),
    );
  }

  Widget _buildSideMenu() {
    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return GestureDetector(
              onTap: () {
                if (mounted) {
                  setState(() {
                    this._activeIndexSide = index;
                  });
                }
              },
              child: Container(
                color: _activeIndexSide == index
                    ? Color(0xffffffff)
                    : Color(0xfff5f5f5),
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                child: Center(
                  child: Text(
                    this._sideMenuList[index]['name'],
                    style: TextStyle(color: Color(0xff333333), fontSize: 14.0),
                  ),
                ),
              ),
            );
          }, childCount: this._sideMenuList.length),
        ),
      ],
    );
  }
}
