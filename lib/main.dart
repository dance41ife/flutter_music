import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/index_page.dart';
import 'package:flutter_shop/pages/music_page.dart';
import 'package:flutter_shop/pages/search_page.dart';
import 'package:flutter_shop/provider/play_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PlaySongsModel>(
          create: (_)=>PlaySongsModel()..init(),
        )
      ],
      child: MyApp(),
    )

  );
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
          "/search":(context) => SearchPage()
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

