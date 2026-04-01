import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/no_params/no_params.dart';
import 'package:movie_app/features/home/domain/entities/user_entity.dart';
import 'package:movie_app/features/home/domain/usecase/get_all_user_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllUserUseCase getAllUserUseCase;
  HomeBloc({required this.getAllUserUseCase}) : super(HomeState()) {
    on<HomeEvent>((event, emit) async {
      await event.when(getAllUser: () => onGetAllUsers(event, emit));
    });
  }

  Future<void> onGetAllUsers(HomeEvent event, Emitter<HomeState> emit) async {
    try {
      final response = await getAllUserUseCase.call(NoParams());
      response.fold((l) {}, (r) {
        emit(state.copyWith(users: r));
      });
    } catch (e) {
      print(e);
    }
  }
}
