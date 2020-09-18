import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

//获取首页主题内容

Future getHomePageContent() async {

  try{
    print('开始获取首页数据....................');
    Response response;
    //必需 否则json里面没有双引号
    BaseOptions options = new BaseOptions(
      responseType: ResponseType.plain
    );
    print("================================>homePageContent url:"+servicePath['homePageContent']);
    Dio dio = new Dio(options);
    response = await dio.get(servicePath['homePageContent']);

    if(response.statusCode == 200){
      print("================================>service:"+response.data.toString());
      return response;
    }else{
      throw Exception('后端接口出现异常。');
    }

  }catch(e){
    return print("ERROR:===============>${e}");
  }

}
Future getMusicListContent(var text) async{

  try{
    print('开始获取音乐数据....................');
    Response response;
    //必需 否则json里面没有双引号
    BaseOptions options = new BaseOptions(
        responseType: ResponseType.plain
    );
    print("================================>homePageContent url:"+servicePath['homePageContent']);
    Dio dio = new Dio(options);
    response = await dio.get(servicePath['musicListContent'],queryParameters: {"list_name":text});

    if(response.statusCode == 200){
      print("================================>service:"+response.data.toString());
      return response;
    }else{
      throw Exception('后端musicListContent接口出现异常。');
    }

  }catch(e){
    return print("ERROR:===============>${e}");
  }
}