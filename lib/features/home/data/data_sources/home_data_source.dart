import 'package:dio/dio.dart';
import 'package:movie_app/core/utils/url_constants.dart';
import 'package:movie_app/features/home/data/models/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_data_source.g.dart';
@RestApi()
abstract class UserDataSource {
  factory UserDataSource(Dio dio) = _UserDataSource;

  @GET(UrlConstants.users)
  Future<List<UserModel>> getUsers();
}
