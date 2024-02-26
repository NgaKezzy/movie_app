import 'package:bloc/bloc.dart';
import 'package:movie_app/config/key_app.dart';
import 'package:movie_app/theme/cubit/theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());
  Future<void> toggedTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    emit(state.copyWith(status: ThemeStatus.loading));
    emit(state.copyWith(isDark: !state.isDark, status: ThemeStatus.success));
    prefs.setBool(KeyApp.isDark, state.isDark);
  }

  Future<void> initTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(state.copyWith(status: ThemeStatus.loading));
    bool value = prefs.getBool(KeyApp.isDark) ?? false;
    emit(state.copyWith(isDark: value, status: ThemeStatus.success));
  }
}
