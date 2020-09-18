import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_shop/widget/music/PlayingWidget.dart';
class CartPage extends StatefulWidget {
  @override
  _CartPage createState() => _CartPage();
}

class _CartPage extends State<CartPage> with AutomaticKeepAliveClientMixin {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    return PlayingWidget();
  }


}
