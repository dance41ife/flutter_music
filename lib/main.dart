import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/index_page.dart';
import 'package:flutter_shop/pages/music_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: 'AcGn Music+',
        initialRoute: "/",
        routes: {
          "/index": (context) => IndexPage(),
          '/music_page': (context) => MusicPage(),
        },
        debugShowCheckedModeBanner: false,//去掉debug
        theme: ThemeData(
          primaryColor: Colors.pink,
        ),
        home:IndexPage(),
      ),
    );
  }
}

