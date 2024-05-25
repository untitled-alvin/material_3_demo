// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppSettingsState {
  bool get compact => throw _privateConstructorUsedError;
  bool get shortcuts => throw _privateConstructorUsedError;
  bool get sso => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppSettingsStateCopyWith<AppSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsStateCopyWith<$Res> {
  factory $AppSettingsStateCopyWith(
          AppSettingsState value, $Res Function(AppSettingsState) then) =
      _$AppSettingsStateCopyWithImpl<$Res, AppSettingsState>;
  @useResult
  $Res call({bool compact, bool shortcuts, bool sso});
}

/// @nodoc
class _$AppSettingsStateCopyWithImpl<$Res, $Val extends AppSettingsState>
    implements $AppSettingsStateCopyWith<$Res> {
  _$AppSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compact = null,
    Object? shortcuts = null,
    Object? sso = null,
  }) {
    return _then(_value.copyWith(
      compact: null == compact
          ? _value.compact
          : compact // ignore: cast_nullable_to_non_nullable
              as bool,
      shortcuts: null == shortcuts
          ? _value.shortcuts
          : shortcuts // ignore: cast_nullable_to_non_nullable
              as bool,
      sso: null == sso
          ? _value.sso
          : sso // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppSettingsStateImplCopyWith<$Res>
    implements $AppSettingsStateCopyWith<$Res> {
  factory _$$AppSettingsStateImplCopyWith(_$AppSettingsStateImpl value,
          $Res Function(_$AppSettingsStateImpl) then) =
      __$$AppSettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool compact, bool shortcuts, bool sso});
}

/// @nodoc
class __$$AppSettingsStateImplCopyWithImpl<$Res>
    extends _$AppSettingsStateCopyWithImpl<$Res, _$AppSettingsStateImpl>
    implements _$$AppSettingsStateImplCopyWith<$Res> {
  __$$AppSettingsStateImplCopyWithImpl(_$AppSettingsStateImpl _value,
      $Res Function(_$AppSettingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compact = null,
    Object? shortcuts = null,
    Object? sso = null,
  }) {
    return _then(_$AppSettingsStateImpl(
      compact: null == compact
          ? _value.compact
          : compact // ignore: cast_nullable_to_non_nullable
              as bool,
      shortcuts: null == shortcuts
          ? _value.shortcuts
          : shortcuts // ignore: cast_nullable_to_non_nullable
              as bool,
      sso: null == sso
          ? _value.sso
          : sso // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AppSettingsStateImpl extends _AppSettingsState {
  _$AppSettingsStateImpl(
      {required this.compact, required this.shortcuts, required this.sso})
      : super._();

  @override
  final bool compact;
  @override
  final bool shortcuts;
  @override
  final bool sso;

  @override
  String toString() {
    return 'AppSettingsState(compact: $compact, shortcuts: $shortcuts, sso: $sso)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingsStateImpl &&
            (identical(other.compact, compact) || other.compact == compact) &&
            (identical(other.shortcuts, shortcuts) ||
                other.shortcuts == shortcuts) &&
            (identical(other.sso, sso) || other.sso == sso));
  }

  @override
  int get hashCode => Object.hash(runtimeType, compact, shortcuts, sso);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingsStateImplCopyWith<_$AppSettingsStateImpl> get copyWith =>
      __$$AppSettingsStateImplCopyWithImpl<_$AppSettingsStateImpl>(
          this, _$identity);
}

abstract class _AppSettingsState extends AppSettingsState {
  factory _AppSettingsState(
      {required final bool compact,
      required final bool shortcuts,
      required final bool sso}) = _$AppSettingsStateImpl;
  _AppSettingsState._() : super._();

  @override
  bool get compact;
  @override
  bool get shortcuts;
  @override
  bool get sso;
  @override
  @JsonKey(ignore: true)
  _$$AppSettingsStateImplCopyWith<_$AppSettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
