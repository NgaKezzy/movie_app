// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LocaleStateCWProxy {
  LocaleState languageCodes(List<String> languageCodes);

  LocaleState languageCode(String languageCode);

  LocaleState status(LocaleStatus status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LocaleState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LocaleState(...).copyWith(id: 12, name: "My name")
  /// ````
  LocaleState call({
    List<String>? languageCodes,
    String? languageCode,
    LocaleStatus? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLocaleState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLocaleState.copyWith.fieldName(...)`
class _$LocaleStateCWProxyImpl implements _$LocaleStateCWProxy {
  const _$LocaleStateCWProxyImpl(this._value);

  final LocaleState _value;

  @override
  LocaleState languageCodes(List<String> languageCodes) =>
      this(languageCodes: languageCodes);

  @override
  LocaleState languageCode(String languageCode) =>
      this(languageCode: languageCode);

  @override
  LocaleState status(LocaleStatus status) => this(status: status);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LocaleState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LocaleState(...).copyWith(id: 12, name: "My name")
  /// ````
  LocaleState call({
    Object? languageCodes = const $CopyWithPlaceholder(),
    Object? languageCode = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return LocaleState(
      languageCodes:
          languageCodes == const $CopyWithPlaceholder() || languageCodes == null
              ? _value.languageCodes
              // ignore: cast_nullable_to_non_nullable
              : languageCodes as List<String>,
      languageCode:
          languageCode == const $CopyWithPlaceholder() || languageCode == null
              ? _value.languageCode
              // ignore: cast_nullable_to_non_nullable
              : languageCode as String,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as LocaleStatus,
    );
  }
}

extension $LocaleStateCopyWith on LocaleState {
  /// Returns a callable class that can be used as follows: `instanceOfLocaleState.copyWith(...)` or like so:`instanceOfLocaleState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LocaleStateCWProxy get copyWith => _$LocaleStateCWProxyImpl(this);
}