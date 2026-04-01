import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/no_params/no_params.dart';
import 'package:movie_app/features/home/data/data_sources/home_data_source.dart';
import 'package:movie_app/features/home/domain/entities/user_entity.dart';
import 'package:movie_app/features/home/domain/repositories/user_repository.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImpl({required this.userDataSource});

  @override
  Future<Either<Failure, List<UserEntity>>> getUsers({
    required NoParams request,
  }) async {
    try {
      final userModels = await userDataSource.getUsers();
      final userEntities =
          userModels.map((userModel) => userModel.toEntity()).toList();

      return Right(userEntities);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
