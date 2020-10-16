import 'package:enum_to_string/enum_to_string.dart';

enum share_preferences_key{
  SearchHistory,
  MusicList
}

String enumConvert2String(enumItem){
  return EnumToString.convertToString(enumItem);
}