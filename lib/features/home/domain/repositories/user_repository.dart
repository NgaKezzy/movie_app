

import 'package:fpdart/fpdart.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/no_params/no_params.dart';
import 'package:movie_app/features/home/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getUsers({required NoParams request});
}
