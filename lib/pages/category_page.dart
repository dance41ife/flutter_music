import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
class CategoryPage extends StatefulWidget {
  @override
  _CategoryPage createState() => _CategoryPage();
}

class _CategoryPage extends State<CategoryPage> {

  TextEditingController typeController1 = TextEditingController();
  TextEditingController typeController2 = TextEditingController();
  TextEditingController typeController3 = TextEditingController();
  String showedText = "231";

    void _choiceAction(){
    print('ready choice........................');
    if(typeController1.text.toString()==null){
      showDialog(
        context: context,
        builder: (context)=>AlertDialog(title: Text('EditText is null'),)
      );
    }else{
      var data ={'"p_Segment1"':'"${typeController1.text.toString()}"','"p_Vendor_Name"':'"${typeController2.text.toString()}"','"p_Customer_Num"':'"${typeController3.text.toString()}"'};
      print(data.toString());
      postHttp(data).then((val){
        setState(() {
          print(val.toString());
          showedText = val['msgValue'].toString();
        });
      });
    }
  }


  Future getHttp(String typeText) async{
    try{
      var data = {'name':typeText};
      Response response = await Dio().get("http://172.123.100.162:8086/testAddSup",queryParameters: data);
      //Response response = await Dio().get("https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name=lolita");
      return response.data;
    }catch(e){
      return print(e);
    }
  }

  Future postHttp(var typeText) async{
    try{
      //Response response = await Dio.post("https://www.easy-mock.com/mock/5f605c3fed072c1818dd6c9b/example/test_post",queryParameters: data);
      //Response response = await Dio().post("http://172.123.100.162:8085/getTestResp",queryParameters: data);
      //Response response = await Dio().get("https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name=lolita");

      Response response = await Dio()
          .post("http://172.123.100.162:8086/testAddSup",
          data: typeText.toString()
      );
      return response.data;
    }catch(e){
      return print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
   return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('SwordArt'),),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: typeController1,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: 'plz',
                      helperText: '请输入segment1'
                  ),
                  autofocus: false,
                ),
                TextField(
                  controller: typeController2,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: 'plz',
                      helperText: '请输入Vendor_Name'
                  ),
                  autofocus: false,
                ),
                TextField(
                  controller: typeController3,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: 'plz',
                      helperText: '请输入Customer_Num'
                  ),
                  autofocus: false,
                ),
                RaisedButton(
                  onPressed: _choiceAction,
                  child: Text('提交'),
                ),
                Text(
                  showedText,
                  overflow: TextOverflow.ellipsis,//文本超出显示省略号
                  maxLines: 1,
                )
              ],
            ),
          ),
        )  //单独滚动组件
      ),
    );
  }
}
