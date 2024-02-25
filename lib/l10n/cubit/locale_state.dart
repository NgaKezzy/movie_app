import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'locale_state.g.dart';

enum LocaleStatus { init, start, loading, success, error }

@CopyWith()
class LocaleState extends Equatable {
  const LocaleState(
      {this.languageCodes = const ['en', 'vi', 'ko', 'ja'],
      this.languageCode = '',
      this.status = LocaleStatus.init});
  final List<String> languageCodes;
  final String languageCode;
  final LocaleStatus status;

  @override
  List<Object> get props => [languageCodes, languageCode, status];
}
