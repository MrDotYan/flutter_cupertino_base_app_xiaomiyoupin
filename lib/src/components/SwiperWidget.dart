import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperWidget extends StatefulWidget {
  SwiperWidget({Key key, this.hasControl = false, this.imgurl, this.onTap})
      : super(key: key);
  final bool hasControl;
  final List<Map> imgurl;
  final onTap;

  @override
  State<StatefulWidget> createState() {
    return SwiperWidgetBuilder();
  }
}

class SwiperWidgetBuilder extends State<SwiperWidget> {
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return buidlerSwiperItem(widget.imgurl, context, index);
      },
      autoplay: true,
      itemCount: widget.imgurl.length,
      pagination: new SwiperPagination(
          alignment: Alignment.bottomRight,
          // 自定与轮播图指示点
          builder: new SwiperCustomPagination(
              builder: (BuildContext context, SwiperPluginConfig config) {
            return new Container(
                // container 颜色透明
                color: Colors.transparent,
                child: new Text(
                  "${config.activeIndex + 1}/${config.itemCount}",
                  style:
                      new TextStyle(fontSize: 20.0, color: Color(0xffffffff)),
                ));
          })),
      control: widget.hasControl ? new SwiperControl() : null,
      onTap: (index) {
        if (widget.onTap != null) {
          widget.onTap(index);
        }
      },
    );
  }
}

// 图片单项
Widget buidlerSwiperItem(List<Map> imgurl, BuildContext context, int index) {
  return Image.asset(
    imgurl[index]['url'],
    fit: BoxFit.cover,
  );
}
