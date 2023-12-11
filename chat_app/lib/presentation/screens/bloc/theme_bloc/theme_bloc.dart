import 'package:chat_app/config/router/services/theme_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState()) {
    on<InitialThemeSetEvent>((event, emit) async {
      const bool hasDarkTheme = true;
      const bool darkSelected = true;
      emit(state.copyWith(isDarkMode: hasDarkTheme, darkValue: darkSelected));
    });

    on<ThemeSwitchEvent>(
      (event, emit) async {
        final isDark = !state.isDarkMode;
        emit(state.copyWith(isDarkMode: isDark));
        await setTheme(isDark);
      },
    );

    on<SwitchColorEvent>(
      (event, emit) async {
        final color = !state.darkValue;
        emit(state.copyWith(darkValue: color));
        await setDarkTheme(color);
      },
    );
  }
}
