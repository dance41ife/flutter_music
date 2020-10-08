class HomeDataStructure {
  int statusCode;
  MsgValue msgValue;

  HomeDataStructure({this.statusCode, this.msgValue});

  HomeDataStructure.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    msgValue = json['msgValue'] != null
        ? new MsgValue.fromJson(json['msgValue'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    if (this.msgValue != null) {
      data['msgValue'] = this.msgValue.toJson();
    }
    return data;
  }
}

class MsgValue {
  List<String> swiperDataList;
  List<TopNaviDataList> topNaviDataList;
  List<MyMusicList> myMusicList;

  MsgValue({this.swiperDataList, this.topNaviDataList, this.myMusicList});

  MsgValue.fromJson(Map<String, dynamic> json) {
    swiperDataList = json['swiperDataList'].cast<String>();
    if (json['topNaviDataList'] != null) {
      topNaviDataList = new List<TopNaviDataList>();
      json['topNaviDataList'].forEach((v) {
        topNaviDataList.add(new TopNaviDataList.fromJson(v));
      });
    }
    if (json['myMusicList'] != null) {
      myMusicList = new List<MyMusicList>();
      json['myMusicList'].forEach((v) {
        myMusicList.add(new MyMusicList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['swiperDataList'] = this.swiperDataList;
    if (this.topNaviDataList != null) {
      data['topNaviDataList'] =
          this.topNaviDataList.map((v) => v.toJson()).toList();
    }
    if (this.myMusicList != null) {
      data['myMusicList'] = this.myMusicList.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

class TopNaviDataList {
  String itemName;
  String url;

  TopNaviDataList({this.itemName, this.url});

  TopNaviDataList.fromJson(Map<String, dynamic> json) {
    itemName = json['item_name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_name'] = this.itemName;
    data['url'] = this.url;
    return data;
  }
}

class MyMusicList {
  String listName;
  String listPicUrl;

  MyMusicList({this.listName, this.listPicUrl});

  MyMusicList.fromJson(Map<String, dynamic> json) {
    listName = json['list_name'];
    listPicUrl = json['list_pic_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['list_name'] = this.listName;
    data['list_pic_url'] = this.listPicUrl;
    return data;
  }
}