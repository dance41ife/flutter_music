import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/config/share_preferences_keys.dart';
import 'package:flutter_shop/utils/share_preferences_util.dart';
import 'package:flutter_shop/widget/search/search_history_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _formKey = GlobalKey<_SearchPageState>();
  bool isHistoryAreaExpanded = false;

  List<String> searchHistory = [];


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPrefs(),
      builder: (context, result) {
        if (result.hasData) {
          SharedPreferences prefs = result.data;
          List<String> temp = prefs.getStringList(enumConvert2String(share_preferences_key.SearchHistory));
          searchHistory = temp == null ? searchHistory : temp;
          return Scaffold(
            backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
            appBar: AppBar(
                backgroundColor: Colors.pink,
                title: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Form(
                            key: _formKey,
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  hintText: "输入歌手名字或者音乐名字",
                                  hintStyle: TextStyle(color: Colors.grey)),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "搜索内容不可为空";
                                }
                                return null;
                              },
                              onFieldSubmitted: (value) async {
                                //  TODO
                                // here should to be net work api call

                                print('asdf$value');
                                searchHistory.add(value);
                                await prefs.setStringList(
                                    enumConvert2String(share_preferences_key.SearchHistory), searchHistory);
                                print('add $value finished');

                              },
                            )),
                      ),
                    ],
                  ),
                )),
            body: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Text("搜索历史"),
                      Container(
                        padding: EdgeInsets.only(left: 220),
                        child: FlatButton(
                          onPressed: () {
                            print("should set grid height");
                            setState(() {
                              isHistoryAreaExpanded = !isHistoryAreaExpanded;
                            });
                          },
                          child: Text(isHistoryAreaExpanded ? "收起" : '展开'),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: [
                          for (String item in searchHistory)
                            searchHistoryItem(item)
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }
        return Center(
          child: Text('加载中...'),
        );
      },
    );
  }
}
