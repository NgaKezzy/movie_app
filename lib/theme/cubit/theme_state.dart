import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.g.dart';

enum ThemeStatus { init, loading, success, error }

@CopyWith()
class ThemeState extends Equatable {
  const ThemeState({this.isLight = true, this.status = ThemeStatus.init});
  final bool isLight;
  final ThemeStatus status;

  @override
  List<Object> get props => [isLight, status];
}
