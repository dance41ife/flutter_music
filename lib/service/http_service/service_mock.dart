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
                "musicName": "人质",
                "musicUrl":"https://freetyst.nf.migu.cn/public/product9th/product41/2020/08/0719/2020%E5%B9%B408%E6%9C%8806%E6%97%A517%E7%82%B948%E5%88%86%E7%B4%A7%E6%80%A5%E5%86%85%E5%AE%B9%E5%87%86%E5%85%A5%E5%8D%8E%E7%BA%B316%E9%A6%96716791/%E6%AD%8C%E6%9B%B2%E4%B8%8B%E8%BD%BD/MP3_40_16_Stero/6005752HZZU191929.mp3?key=cd7263f162a45c9f&Tim=1609298890445&channelid=00&msisdn=5e00c7cc8b1245db9298a5743be1b6bb&CI=6005752HZZU2600919000000528429&F=000009"
            },
            {
                "musicName": "月牙湾",
                "musicUrl":"https://freetyst.nf.migu.cn/public/product9th/product41/2020/08/1315/2020%E5%B9%B408%E6%9C%8806%E6%97%A517%E7%82%B949%E5%88%86%E7%B4%A7%E6%80%A5%E5%86%85%E5%AE%B9%E5%87%86%E5%85%A5%E5%8D%8E%E7%BA%B324%E9%A6%96951303/%E6%AD%8C%E6%9B%B2%E4%B8%8B%E8%BD%BD/MP3_40_16_Stero/6005752J00U154126.mp3?key=13b30edcb62b0b48&Tim=1609299822853&channelid=00&msisdn=2fad72b8c3a246ab92cf63c94ef0712a&CI=6005752J00U2600919000000525797&F=000009"
            },
            {
                "musicName": "给我一首歌的时间",
                "musicUrl":"https://freetyst.nf.migu.cn/public/product9th/product41/2020/08/1013/2009%E5%B9%B406%E6%9C%8826%E6%97%A5%E5%8D%9A%E5%B0%94%E6%99%AE%E6%96%AF/%E6%AD%8C%E6%9B%B2%E4%B8%8B%E8%BD%BD/MP3_40_16_Stero/60054702001133403.mp3?key=9e2d93423c2d3a0f&Tim=1609299899385&channelid=00&msisdn=584d0a171ab94ea0ae52f19a949ac041&CI=600547020012600902000006889050&F=000009"
            },
            {
                "musicName": "断了的弦",
                "musicUrl":"https://freetyst.nf.migu.cn/public/ringmaker01/n17/2017/07/2009%E5%B9%B406%E6%9C%8826%E6%97%A5%E5%8D%9A%E5%B0%94%E6%99%AE%E6%96%AF/%E6%AD%8C%E6%9B%B2%E4%B8%8B%E8%BD%BD/MP3_40_16_Stero/%E6%96%AD%E4%BA%86%E7%9A%84%E5%BC%A6-%E5%91%A8%E6%9D%B0%E4%BC%A6.mp3?key=8d26d303eeb6e836&Tim=1609299939423&channelid=00&msisdn=2db4fcae1a2f4facb1aaf71fbb6b7d82&CI=600547019332600902000006889326&F=000009"
            },
            {
                "musicName": "老街",
                "musicUrl":"https://freetyst.nf.migu.cn/public/ringmaker01/n17/2017/04/2013%E5%B9%B404%E6%9C%8816%E6%97%A5%E7%8B%AC%E7%AB%8B%E9%9F%B3%E4%B9%90%E4%BA%BA%E5%BC%95%E5%85%A5%E6%9D%8E%E8%8D%A3%E6%B5%A9%E5%86%85%E5%AE%B9%E5%87%86%E5%85%A52%E9%A6%96/%E6%AD%8C%E6%9B%B2%E4%B8%8B%E8%BD%BD/MP3_40_16_Stero/%E8%80%81%E8%A1%97-%E6%9D%8E%E8%8D%A3%E6%B5%A9.mp3?key=2cf75772bce8a494&Tim=1609300000613&channelid=00&msisdn=274c9972400e417188e57aea3a7fcff4&CI=634879000012600902000007946027&F=000009"
            },
            {
                "musicName": "如果你也听说",
                "musicUrl":"https://freetyst.nf.migu.cn/public/product8th/product39/2020/04/1700/1%E6%9C%88EMI4224%E9%A6%96%E6%AD%8C%E6%9B%B2/%E6%AD%8C%E6%9B%B2%E4%B8%8B%E8%BD%BD/MP3_40_16_Stero/60056548564000923.mp3?key=d8fcf11b11722a3f&Tim=1609300108636&channelid=00&msisdn=0ea22c8654654561961e71c05a6e8e87&CI=600565485642600902000006327162&F=000009"
            },
            {
                "musicName": "Sparks Fly",
                "musicUrl":"https://freetyst.nf.migu.cn/public/product5th/product34/2019/07/0515/2018%E5%B9%B411%E6%9C%8809%E6%97%A501%E7%82%B945%E5%88%86%E6%89%B9%E9%87%8F%E9%A1%B9%E7%9B%AE%E6%AD%A3%E4%B8%9C98%E9%A6%96-5/%E6%AD%8C%E6%9B%B2%E4%B8%8B%E8%BD%BD/MP3_40_16_Stero/6005661HF3F.mp3?key=57c22908fc7f7b74&Tim=1609300189033&channelid=00&msisdn=5376984101b847b9aa18b769c2adcd68&CI=6005661HF3F2600914000000014401&F=000009"
            },
            {
                "musicName": "爱转角",
                "musicUrl":"https://freetyst.nf.migu.cn/public/product9th/product41/2020/07/0210/2020%E5%B9%B406%E6%9C%8830%E6%97%A515%E7%82%B941%E5%88%86%E7%B4%A7%E6%80%A5%E5%86%85%E5%AE%B9%E5%87%86%E5%85%A5%E5%92%AA%E5%92%95AVEX42805%E9%A6%96/%E6%AD%8C%E6%9B%B2%E4%B8%8B%E8%BD%BD/MP3_40_16_Stero/69962300513103621.mp3?key=06581a19555bad97&Tim=1609300257717&channelid=00&msisdn=ea86d7da662e4299b59c94992430ff65&CI=699623005132600913000009975482&F=000009"
            },
            {
                "musicName": "爱就一个字",
                "musicUrl":"https://freetyst.nf.migu.cn/public/product9th/product41/2020/08/1013/3%E6%9C%88%E5%85%A8%E6%9B%B2%E7%94%B3%E6%8A%A53383%E9%A6%96600597/%E6%AD%8C%E6%9B%B2%E4%B8%8B%E8%BD%BD/MP3_40_16_Stero/60059704167134415.mp3?key=05bc228e6db90f0b&Tim=1609300353180&channelid=00&msisdn=8bf9f37af7c94a15b9f1faa8a42b1d86&CI=600597041672600902000001004028&F=000009"
            },
             {
                "musicName": "年少有为",
                "musicUrl":"https://freetyst.nf.migu.cn/public/product9th/product41/2020/08/1315/2020%E5%B9%B408%E6%9C%8806%E6%97%A517%E7%82%B950%E5%88%86%E7%B4%A7%E6%80%A5%E5%86%85%E5%AE%B9%E5%87%86%E5%85%A5%E5%8D%8E%E7%BA%B317%E9%A6%96456220/%E6%AD%8C%E6%9B%B2%E4%B8%8B%E8%BD%BD/MP3_40_16_Stero/6005752J01E154259.mp3?key=302137d10e82d43a&Tim=1609300527107&channelid=00&msisdn=6ad2c56b9e304ebd92a41bc999013ccc&CI=6005752J01E2600919000000528493&F=000009"
            },
             {
                "musicName": "梦一场",
                "musicUrl":"https://freetyst.nf.migu.cn/public/product9th/product41/2020/06/0819/2019%E5%B9%B405%E6%9C%8820%E6%97%A511%E7%82%B908%E5%88%86%E5%86%85%E5%AE%B9%E5%87%86%E5%85%A5%E5%8D%8E%E7%BA%B3182%E9%A6%96362339/%E6%AD%8C%E6%9B%B2%E4%B8%8B%E8%BD%BD/MP3_40_16_Stero/6005751T4WG191617.mp3?key=afb8f060f2281778&Tim=1609300587853&channelid=00&msisdn=077e800817984eb490944db62c3229a0&CI=6005751T4WG2600913000003947604&F=000009"
            },
             {
                "musicName": "Love Story",
                "musicUrl":"https://freetyst.nf.migu.cn/public/product9th/product41/2020/08/1013/2019%E5%B9%B403%E6%9C%8808%E6%97%A510%E7%82%B911%E5%88%86%E7%B4%A7%E6%80%A5%E5%86%85%E5%AE%B9%E5%87%86%E5%85%A5%E6%AD%A3%E4%B8%9C16%E9%A6%96232257/%E6%AD%8C%E6%9B%B2%E4%B8%8B%E8%BD%BD/MP3_40_16_Stero/6005661U9NF131959.mp3?key=5d0bfe882d84124f&Tim=1609300640825&channelid=00&msisdn=c11810670adb40bca291730000559f1c&CI=6005661U9NF2600913000002823085&F=000009"
            }
        ]
    }
}
  ''';

  return resultJson;
}
