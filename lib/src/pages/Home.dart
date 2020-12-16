import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import '../components/CupertinoNavBar.dart';
import '../components/SwiperWidget.dart';
import '../components/CupertinoLoadingWidget.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  HomeBase createState() => HomeBase();
}

class HomeBase extends State<Home> {
  // is to bottom
  bool isToBottom = false;
  // scroll controller
  ScrollController _scrollController = new ScrollController();
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
  // 广告下面的shangpin
  List _shopList = [
    'lib/assets/image/shop1.png',
    'lib/assets/image/shop2.png',
    'lib/assets/image/shop3.png',
    'lib/assets/image/shop4.png',
  ];
  // list menu 菜单
  List<Map> _listMenu = [
    {"icon": 'lib/assets/image/1.png', "text": '上新推荐'},
    {"icon": 'lib/assets/image/2.png', "text": '小米众筹'},
    {"icon": 'lib/assets/image/3.png', "text": '有品秒杀'},
    {"icon": 'lib/assets/image/4.png', "text": '热销排行'},
    {"icon": 'lib/assets/image/5.png', "text": '小米自营'},
    {"icon": 'lib/assets/image/6.png', "text": '下单立返'},
    {"icon": 'lib/assets/image/7.png', "text": '9.9包邮'},
    {"icon": 'lib/assets/image/8.png', "text": '有品直播'},
    {"icon": 'lib/assets/image/9.png', "text": '智能生活'},
    {"icon": 'lib/assets/image/10.png', "text": '小米庄园'},
  ];

  @override
  void initState() {
    super.initState();
    this._scrollController
      ..addListener(() {
        if (!this.isToBottom) {
          if (this._scrollController.offset -
                  this._scrollController.position.maxScrollExtent >=
              60) {
            if (mounted) {
              setState(() {
                this.isToBottom = true;
              });
              Future.delayed(Duration(seconds: 2), () {
                if (mounted) {
                  setState(() {
                    this.isToBottom = false;
                  });
                }
              });
            }
            print('到底了!');
          }
        }
      });
  }

  /*
  * 点击搜索按钮导航到搜索页面
  */
  void _searchEvent(context) {
    print('search');
    Navigator.of(context).pushNamed('/search');
  }

  ///扫码图标按钮
  Widget _builScanWidget() {
    return Row(
      children: [
        CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(
              IconData(0xe689, fontFamily: 'tbicon'),
              color: Color(0xfff000000),
            ),
            onPressed: () {
              print('scan');
            }),
        Padding(
          padding: EdgeInsets.only(left: 3),
          child: Text(
            '小米没品',
            style: TextStyle(fontSize: 12),
          ),
        )
      ],
    );
  }

  ///搜索图标按钮
  Widget _buildSearchWidget() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Icon(
        IconData(0xe65c, fontFamily: 'tbicon'),
        color: Color(0xfff000000),
      ),
      onPressed: () {
        this._searchEvent(context);
      },
    );
  }

  // 菜单
  Widget _buildGrideMenu() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: GridView(
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.8,
            crossAxisCount: 5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        children: List<Widget>.from(this._listMenu.map((item) {
          return GestureDetector(
            onTap: () {
              print(item['icon']);
            },
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    item['icon'],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    item['text'],
                    style: TextStyle(fontSize: 12, color: Color(0xff666666)),
                  )
                ],
              ),
            ),
          );
        }).toList()),
      ),
    );
  }

  //轮播图
  Widget _buildSwiperWidget() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: SwiperWidget(
          imgurl: [
            {
              "url": "lib/assets/image/banner1.jpeg",
            },
            {
              "url": "lib/assets/image/banner2.jpeg",
            },
            {
              "url": "lib/assets/image/banner3.jpeg",
            },
          ],
        ));
  }

  // 广告
  Widget _buildAdvWidget() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 4, right: 4),
          child: Image.asset('lib/assets/image/adv.gif'),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 4, right: 4),
          child: Image.asset('lib/assets/image/adv2.gif'),
        )
      ],
    );
  }

  // 推荐商品
  Widget _buildRowFourItem() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List<Widget>.from(this._shopList.map((e) {
            return Container(
              child: Image.asset(
                e,
                width: (MediaQuery.of(context).size.width - 30) / 4,
              ),
            );
          }).toList())),
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

  Widget build(context) {
    double paddingValue = MediaQuery.of(context).padding.top + 44.0;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavBar(
        padding: EdgeInsetsDirectional.only(start: 0, end: 0),
        heroTag: "Home",
        transitionBetweenRoutes: false,
        leading: _builScanWidget(),
        trailing: _buildSearchWidget(),
      ),
      child: Container(
        color: Color(0xfff5f5f5),
        margin: EdgeInsets.only(top: paddingValue, bottom: 50.0),
        child: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: <Widget>[
            CupertinoSliverRefreshControl(
              refreshTriggerPullDistance: 60.0,
              refreshIndicatorExtent: 60.0,
              onRefresh: () async {
                print('is runing ?');
                await Future.delayed(Duration(milliseconds: 1000));
              },
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                _buildSwiperWidget(),
                _buildGrideMenu(),
                _buildAdvWidget(),
                _buildRowFourItem(),
                _buildWrapForList(),
                BuilderLoading.builder()
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
