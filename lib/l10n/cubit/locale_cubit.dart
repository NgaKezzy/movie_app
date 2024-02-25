import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/l10n/cubit/locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(const LocaleState());
  void setLanguageCode() {
    emit(state.copyWith(status: LocaleStatus.loading));
    emit(state.copyWith(languageCode: 'vi'));
  }
}
