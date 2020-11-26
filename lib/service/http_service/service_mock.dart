import 'dart:async';

const HomePageContentJsonResult = '''
 {
    "statusCode": 200,
    "msgValue": {
        
        "swiperDataList": [
            "http://123.207.87.254:3999/uploads/2020-10-06/9f0e0a81.jpg",
            "http://123.207.87.254:3999/uploads/2020-10-06/05437476.jpg",
            "http://123.207.87.254:3999/uploads/2020-10-06/de3c893c.jpeg"
        ],
        "topNaviDataList": [
            {
                "item_name": "akalin",
                "url": "http://123.207.87.254:3999/uploads/2020-10-06/540402e4.png"
            },
            {
                "item_name": "chidanta",
                "url": "http://123.207.87.254:3999/uploads/2020-10-06/b897063e.jpg"
            },
            {
                "item_name": "dangyang",
                "url": "http://123.207.87.254:3999/uploads/2020-10-06/3e1d4408.jpg"
            },
            {
                "item_name": "jiwawa",
                "url": "http://123.207.87.254:3999/uploads/2020-10-06/6da22b29.jpg"
            },
            {
                "item_name": "leimu",
                "url": "http://123.207.87.254:3999/uploads/2020-10-06/85dd32ca.jpg"
            },
            {
                "item_name": "yinlili",
                "url": "http://123.207.87.254:3999/uploads/2020-10-06/76ca607a.jpg"
            },
            {
                "item_name": "qigong",
                "url": "http://123.207.87.254:3999/uploads/2020-10-06/04e128e9.jpg"
            },
            {
                "item_name": "tuanzi",
                "url": "http://123.207.87.254:3999/uploads/2020-10-06/d23abe8b.jpeg"
            },
            {
                "item_name": "xiaoyesi",
                "url": "http://123.207.87.254:3999/uploads/2020-10-06/717ba855.png"
            },
            {
                "item_name": "yinzi",
                "url": "http://123.207.87.254:3999/uploads/2020-10-06/cc870dad.png"
            }
        ],
        "myMusicList": [
            {
                "list_name": "2 plus",
                "list_pic_url": "http://123.207.87.254:3999/uploads/2020-10-06/bfcd8429.png"
            },
            {
                "list_name": "3 plus",
                "list_pic_url": "http://123.207.87.254:3999/uploads/2020-10-06/bfcd8429.png"
            },
            {
                "list_name": "4 plus",
                "list_pic_url": "http://123.207.87.254:3999/uploads/2020-10-06/bfcd8429.png"
            },
            {
                "list_name": "5 plus",
                "list_pic_url": "http://123.207.87.254:3999/uploads/2020-10-06/bfcd8429.png"
            },
            {
                "list_name": "6 plus",
                "list_pic_url": "http://123.207.87.254:3999/uploads/2020-10-06/bfcd8429.png"
            },
                {
                "list_name": "7 plus",
                "list_pic_url": "http://123.207.87.254:3999/uploads/2020-10-06/bfcd8429.png"
            },
                {
                "list_name": "8 plus",
                "list_pic_url": "http://123.207.87.254:3999/uploads/2020-10-06/bfcd8429.png"
            }
           
        ]
    }
}
''';

const MockMusicUrl = "http://freetyst.nf.migu.cn/public/product9th/product41/2020/08/1013/2009%E5%B9%B406%E6%9C%8826%E6%97%A5%E5%8D%9A%E5%B0%94%E6%99%AE%E6%96%AF/%E6%AD%8C%E6%9B%B2%E4%B8%8B%E8%BD%BD/MP3_40_16_Stero/60054701921134458.mp3?key=e76e09da033d92bd&Tim=1601986771151&channelid=00&msisdn=f8ed6afd6c0b432f84f422fb32b35760&CI=600547019212600902000006889374&F=000009";

Future getHomePageContentMock() async {
  return HomePageContentJsonResult;
}

Future getMusicListContentMock(var text) async {
  var resultJson = '''
  {
    "statusCode": 200,
    "msgValue": {
        "musicList": [
            {
                "musicName": "心墙",
                "musicUrl":"https://freetyst.nf.migu.cn/public/product08/2018/03/05/2013%E5%B9%B49%E6%9C%8823%E6%97%A5%E7%B4%A7%E6%80%A5%E5%87%86%E5%85%A5%E9%BD%90%E5%8A%9B%E9%9F%B3%E4%B9%9023%E9%A6%96/%E6%AD%8C%E6%9B%B2%E4%B8%8B%E8%BD%BD/MP3_40_16_Stero/%E5%BF%83%E5%A2%99(%E7%94%B5%E8%A7%86%E5%89%A7%E6%B5%81%E6%98%9F%E8%8A%B1%E5%9B%AD%E7%89%87%E5%B0%BE%E6%9B%B2)-%E9%83%AD%E9%9D%99.mp3?key=757f9c0039bf684e&Tim=1603794541628&channelid=00&msisdn=0d2e44ee3baa4dc49f8fcc6a6089eeca&CI=600836110782600907000001606359&F=000009"
            },
            {
                "musicName": "Hey Jude",
                "musicUrl":"https://s128.xiami.net/169/7169/374967/1769446601_1183058_l.mp3?ccode=xiami__&expire=86400&duration=278&psid=6a94e35a3c01a9f27f5652a7e19855ad&ups_client_netip=null&ups_ts=1605944398&ups_userid=0&utid=&vid=1769446601&fn=1769446601_1183058_l.mp3&vkey=B2d4a612a9a8aa2e198bb883a90cab8b9"
            },
            {
                "musicName": "$text(2)",
                "musicUrl":"$MockMusicUrl"
            },
            {
                "musicName": "$text(3)",
                "musicUrl":"$MockMusicUrl"
            },
            {
                "musicName": "$text(4)",
                "musicUrl":"$MockMusicUrl"
            },
            {
                "musicName": "$text(5)",
                "musicUrl":"$MockMusicUrl"
            },
            {
                "musicName": "$text(6)",
                "musicUrl":"$MockMusicUrl"
            },
            {
                "musicName": "$text(7)",
                "musicUrl":"$MockMusicUrl"
            },
            {
                "musicName": "$text(8)",
                "musicUrl":"$MockMusicUrl"
            },
            {
                "musicName": "$text(9)",
                "musicUrl":"$MockMusicUrl"
            },
             {
                "musicName": "$text(10)",
                "musicUrl":"$MockMusicUrl"
            },
             {
                "musicName": "$text(11)",
                "musicUrl":"$MockMusicUrl"
            },
             {
                "musicName": "$text(12)",
                "musicUrl":"$MockMusicUrl"
            }
        ]
    }
}
  ''';

  return resultJson;
}
