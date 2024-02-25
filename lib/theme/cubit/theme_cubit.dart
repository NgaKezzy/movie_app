import 'package:bloc/bloc.dart';
import 'package:movie_app/theme/cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());
  void toggedTheme() {
    emit(state.copyWith(status: ThemeStatus.init));
    emit(state.copyWith(isLight: !state.isLight, status: ThemeStatus.success));
  }
}
