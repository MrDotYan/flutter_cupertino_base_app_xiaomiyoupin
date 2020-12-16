import 'package:flutter/cupertino.dart';

class BuilderLoading {
  static Widget builder() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CupertinoActivityIndicator(),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'loading...',
              style: TextStyle(fontSize: 12, color: Color(0xff999999)),
            ),
          )
        ],
      ),
    );
  }
}
