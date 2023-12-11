import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isDark() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool("is_dark") ?? false;
}

Future<void> setTheme(bool isDark) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("is_dark", isDark);
}

Future<bool> getDarkTheme() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool("darkTheme") ?? false;
}

Future<void> setDarkTheme(bool isDark) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("darkTheme", isDark);
}

// Future<int> getColor() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getInt("selected_color") ?? 1;
// }

// Future<void> setColor(int color) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setInt("selected_color", color);
// }
