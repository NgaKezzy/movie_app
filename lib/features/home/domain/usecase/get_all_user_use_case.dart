import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/no_params/no_params.dart';
import 'package:movie_app/core/usecase/use_case.dart';
import 'package:movie_app/features/home/domain/entities/user_entity.dart';
import 'package:movie_app/features/home/domain/repositories/user_repository.dart';

@injectable
class GetAllUserUseCase extends UseCase<List<UserEntity>, NoParams> {
  final UserRepository userRepository;

  GetAllUserUseCase({required this.userRepository});

  @override
  Future<Either<Failure, List<UserEntity>>> call(NoParams params) async {
    return userRepository.getUsers(request: params);
  }
}
