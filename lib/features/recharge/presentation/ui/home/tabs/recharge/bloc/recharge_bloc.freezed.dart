// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recharge_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RechargeState {
  bool? get isLoading => throw _privateConstructorUsedError;
  String? get beneficiaryError => throw _privateConstructorUsedError;
  dynamic get beneficiarySuccess => throw _privateConstructorUsedError;
  List<BeneficiaryModel>? get beneficiariesList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RechargeStateCopyWith<RechargeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RechargeStateCopyWith<$Res> {
  factory $RechargeStateCopyWith(
          RechargeState value, $Res Function(RechargeState) then) =
      _$RechargeStateCopyWithImpl<$Res, RechargeState>;
  @useResult
  $Res call(
      {bool? isLoading,
      String? beneficiaryError,
      dynamic beneficiarySuccess,
      List<BeneficiaryModel>? beneficiariesList});
}

/// @nodoc
class _$RechargeStateCopyWithImpl<$Res, $Val extends RechargeState>
    implements $RechargeStateCopyWith<$Res> {
  _$RechargeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? beneficiaryError = freezed,
    Object? beneficiarySuccess = freezed,
    Object? beneficiariesList = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      beneficiaryError: freezed == beneficiaryError
          ? _value.beneficiaryError
          : beneficiaryError // ignore: cast_nullable_to_non_nullable
              as String?,
      beneficiarySuccess: freezed == beneficiarySuccess
          ? _value.beneficiarySuccess
          : beneficiarySuccess // ignore: cast_nullable_to_non_nullable
              as dynamic,
      beneficiariesList: freezed == beneficiariesList
          ? _value.beneficiariesList
          : beneficiariesList // ignore: cast_nullable_to_non_nullable
              as List<BeneficiaryModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RechargeStateImplCopyWith<$Res>
    implements $RechargeStateCopyWith<$Res> {
  factory _$$RechargeStateImplCopyWith(
          _$RechargeStateImpl value, $Res Function(_$RechargeStateImpl) then) =
      __$$RechargeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? isLoading,
      String? beneficiaryError,
      dynamic beneficiarySuccess,
      List<BeneficiaryModel>? beneficiariesList});
}

/// @nodoc
class __$$RechargeStateImplCopyWithImpl<$Res>
    extends _$RechargeStateCopyWithImpl<$Res, _$RechargeStateImpl>
    implements _$$RechargeStateImplCopyWith<$Res> {
  __$$RechargeStateImplCopyWithImpl(
      _$RechargeStateImpl _value, $Res Function(_$RechargeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? beneficiaryError = freezed,
    Object? beneficiarySuccess = freezed,
    Object? beneficiariesList = freezed,
  }) {
    return _then(_$RechargeStateImpl(
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      beneficiaryError: freezed == beneficiaryError
          ? _value.beneficiaryError
          : beneficiaryError // ignore: cast_nullable_to_non_nullable
              as String?,
      beneficiarySuccess: freezed == beneficiarySuccess
          ? _value.beneficiarySuccess!
          : beneficiarySuccess,
      beneficiariesList: freezed == beneficiariesList
          ? _value._beneficiariesList
          : beneficiariesList // ignore: cast_nullable_to_non_nullable
              as List<BeneficiaryModel>?,
    ));
  }
}

/// @nodoc

class _$RechargeStateImpl implements _RechargeState {
  const _$RechargeStateImpl(
      {this.isLoading,
      this.beneficiaryError,
      this.beneficiarySuccess,
      final List<BeneficiaryModel>? beneficiariesList})
      : _beneficiariesList = beneficiariesList;

  @override
  final bool? isLoading;
  @override
  final String? beneficiaryError;
  @override
  final dynamic beneficiarySuccess;
  final List<BeneficiaryModel>? _beneficiariesList;
  @override
  List<BeneficiaryModel>? get beneficiariesList {
    final value = _beneficiariesList;
    if (value == null) return null;
    if (_beneficiariesList is EqualUnmodifiableListView)
      return _beneficiariesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RechargeState(isLoading: $isLoading, beneficiaryError: $beneficiaryError, beneficiarySuccess: $beneficiarySuccess, beneficiariesList: $beneficiariesList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RechargeStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.beneficiaryError, beneficiaryError) ||
                other.beneficiaryError == beneficiaryError) &&
            const DeepCollectionEquality()
                .equals(other.beneficiarySuccess, beneficiarySuccess) &&
            const DeepCollectionEquality()
                .equals(other._beneficiariesList, _beneficiariesList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      beneficiaryError,
      const DeepCollectionEquality().hash(beneficiarySuccess),
      const DeepCollectionEquality().hash(_beneficiariesList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RechargeStateImplCopyWith<_$RechargeStateImpl> get copyWith =>
      __$$RechargeStateImplCopyWithImpl<_$RechargeStateImpl>(this, _$identity);
}

abstract class _RechargeState implements RechargeState {
  const factory _RechargeState(
      {final bool? isLoading,
      final String? beneficiaryError,
      final dynamic beneficiarySuccess,
      final List<BeneficiaryModel>? beneficiariesList}) = _$RechargeStateImpl;

  @override
  bool? get isLoading;
  @override
  String? get beneficiaryError;
  @override
  dynamic get beneficiarySuccess;
  @override
  List<BeneficiaryModel>? get beneficiariesList;
  @override
  @JsonKey(ignore: true)
  _$$RechargeStateImplCopyWith<_$RechargeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
