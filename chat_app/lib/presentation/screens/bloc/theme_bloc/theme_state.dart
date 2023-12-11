part of 'theme_bloc.dart';

class ThemeState {
  final bool isDarkMode;
  final bool darkValue;

  ThemeState({
    this.darkValue = false,
    this.isDarkMode = true,
  });

  ThemeData getTheme(BuildContext context) {
    var baseTheme = ThemeData(brightness: isDarkMode ? Brightness.dark : Brightness.light);
    return ThemeData(
      textTheme: GoogleFonts.quicksandTextTheme(baseTheme.textTheme),
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      dividerColor: Colors.transparent,
      scaffoldBackgroundColor: isDarkMode ? (darkValue ? Colors.black : const Color.fromRGBO(22, 32, 42, 1)) : Colors.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showSelectedLabels: false,
        backgroundColor: (isDarkMode)
            ? (darkValue)
                ? Colors.black
                : const Color.fromRGBO(22, 32, 42, 1)
            : Colors.white,
        showUnselectedLabels: false,
        unselectedIconTheme: IconThemeData(color: (isDarkMode) ? Colors.white : Colors.black),
      ),
      colorSchemeSeed: const Color.fromRGBO(68, 139, 204, 1),
      dialogBackgroundColor: isDarkMode ? (darkValue ? Colors.black : const Color.fromRGBO(22, 32, 42, 1)) : Colors.white,
      cardColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        foregroundColor: !isDarkMode ? (darkValue ? Colors.black : const Color.fromRGBO(22, 32, 42, 1)) : Colors.white,
        color: isDarkMode ? (darkValue ? Colors.black : const Color.fromRGBO(22, 32, 42, 1)) : Colors.white,
      ),
    );
  }

  ThemeState copyWith({bool? darkValue, bool? isDarkMode}) =>
      ThemeState(darkValue: darkValue ?? this.darkValue, isDarkMode: isDarkMode ?? this.isDarkMode);
}
