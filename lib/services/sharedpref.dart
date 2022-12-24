import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPref;

Future<void> sharedPrefInit() async {
  sharedPref = await SharedPreferences.getInstance();
}
