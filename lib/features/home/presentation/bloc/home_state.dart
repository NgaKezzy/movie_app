part of 'home_bloc.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({@Default([]) List<UserEntity> users}) = _HomeState;
}