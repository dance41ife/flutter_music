import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> getPrefs() async {
  SharedPreferences instance = await SharedPreferences.getInstance();
  return instance;
}
