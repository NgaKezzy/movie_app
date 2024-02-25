import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'locale_state.g.dart';

enum LocaleStatus { init, start, loading, success, error }

List<String> countryNames = [
  'English',
  'Vietnamese',
];
List<String> codes = ['en', 'vi'];

@CopyWith()
class LocaleState extends Equatable {
  const LocaleState(
      {this.languageCodes = const [],
      this.languageCode = '',
      this.countryNames = const [],
      this.isSelectLanguage = false,
      this.status = LocaleStatus.init});
  final List<String> languageCodes;
  final String languageCode;
  final List<String> countryNames;
  final bool isSelectLanguage;
  final LocaleStatus status;

  @override
  List<Object> get props => [
        languageCodes,
        languageCode,
        countryNames,
        isSelectLanguage,
        status,
      ];
}
