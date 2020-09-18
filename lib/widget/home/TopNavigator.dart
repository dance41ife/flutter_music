import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//头部导航
class TopNavigator extends StatelessWidget {
  final List navigatorList;

  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print('点击导航');
      },
      child: Column(
        children: <Widget>[
          Container(
              width: ScreenUtil().setWidth(95),//必须设置 否则NetWorkImage不显示
              height: ScreenUtil().setWidth(95),//必须设置 否则NetWorkImage不显示
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(item['url']),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(40)))
              ),
          Text(item['item_name'])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
          crossAxisCount: 5,
          padding: EdgeInsets.all(5.0),
          children: navigatorList.map((item) {
            return _gridViewItemUI(context, item);
          }).toList() //必须要to_list不然要报错！
          ),
    );
  }
}
