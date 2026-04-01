// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Failure _$FailureFromJson(Map<String, dynamic> json) => _Failure(
  error: json['error'] as bool? ?? false,
  message: json['message'] as String? ?? '',
);

Map<String, dynamic> _$FailureToJson(_Failure instance) => <String, dynamic>{
  'error': instance.error,
  'message': instance.message,
};
