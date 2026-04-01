import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/features/home/domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
sealed class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String name,
    required String username,
    required String email,
    required AddressModel address,
    required String phone,
    required String website,
    required CompanyModel company,
  }) = _UserModel;

  const UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromEntity(UserEntity entity) => UserModel(
    id: entity.id,
    name: entity.name,
    username: entity.username,
    email: entity.email,
    address: AddressModel.fromEntity(entity.address),
    phone: entity.phone,
    website: entity.website,
    company: CompanyModel.fromEntity(entity.company),
  );

  UserEntity toEntity() => UserEntity(
    id: id,
    name: name,
    username: username,
    email: email,
    address: address.toEntity(),
    phone: phone,
    website: website,
    company: company.toEntity(),
  );
}

@freezed
sealed class AddressModel with _$AddressModel {
  const factory AddressModel({
    required String street,
    required String suite,
    required String city,
    required String zipcode,
    required GeoModel geo,
  }) = _AddressModel;

  const AddressModel._();

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  factory AddressModel.fromEntity(Address entity) => AddressModel(
    street: entity.street,
    suite: entity.suite,
    city: entity.city,
    zipcode: entity.zipcode,
    geo: GeoModel.fromEntity(entity.geo),
  );

  Address toEntity() => Address(
    street: street,
    suite: suite,
    city: city,
    zipcode: zipcode,
    geo: geo.toEntity(),
  );
}

@freezed
sealed class GeoModel with _$GeoModel {
  const factory GeoModel({required String lat, required String lng}) =
      _GeoModel;

  const GeoModel._();

  factory GeoModel.fromJson(Map<String, dynamic> json) =>
      _$GeoModelFromJson(json);

  factory GeoModel.fromEntity(Geo entity) =>
      GeoModel(lat: entity.lat, lng: entity.lng);

  Geo toEntity() => Geo(lat: lat, lng: lng);
}

@freezed
sealed class CompanyModel with _$CompanyModel {
  const factory CompanyModel({
    required String name,
    required String catchPhrase,
    required String bs,
  }) = _CompanyModel;

  const CompanyModel._();

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  factory CompanyModel.fromEntity(Company entity) => CompanyModel(
    name: entity.name,
    catchPhrase: entity.catchPhrase,
    bs: entity.bs,
  );

  Company toEntity() => Company(name: name, catchPhrase: catchPhrase, bs: bs);
}
