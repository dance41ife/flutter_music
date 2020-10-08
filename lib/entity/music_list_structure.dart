class MusicList {
  int statusCode;
  MsgValue msgValue;

  MusicList({this.statusCode, this.msgValue});

  MusicList.fromJson(Map<String, dynamic> json) {
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
  List<MusicListItem> musicList;

  MsgValue({this.musicList});

  MsgValue.fromJson(Map<String, dynamic> json) {
    if (json['musicList'] != null) {
      musicList = new List<MusicListItem>();
      json['musicList'].forEach((v) {
        musicList.add(new MusicListItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.musicList != null) {
      data['musicList'] = this.musicList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MusicListItem {
  String musicName;
  String musicUrl;

  MusicListItem({this.musicName, this.musicUrl});

  MusicListItem.fromJson(Map<String, dynamic> json) {
    musicName = json['musicName'];
    musicUrl = json['musicUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['musicName'] = this.musicName;
    data['musicUrl'] = this.musicUrl;
    return data;
  }
}