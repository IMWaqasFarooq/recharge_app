// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_up_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TopUpState {
  bool? get isLoading => throw _privateConstructorUsedError;
  dynamic get isSuccess => throw _privateConstructorUsedError;
  int? get selectedAmount => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TopUpStateCopyWith<TopUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopUpStateCopyWith<$Res> {
  factory $TopUpStateCopyWith(
          TopUpState value, $Res Function(TopUpState) then) =
      _$TopUpStateCopyWithImpl<$Res, TopUpState>;
  @useResult
  $Res call(
      {bool? isLoading, dynamic isSuccess, int? selectedAmount, String? error});
}

/// @nodoc
class _$TopUpStateCopyWithImpl<$Res, $Val extends TopUpState>
    implements $TopUpStateCopyWith<$Res> {
  _$TopUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isSuccess = freezed,
    Object? selectedAmount = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as dynamic,
      selectedAmount: freezed == selectedAmount
          ? _value.selectedAmount
          : selectedAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopUpStateImplCopyWith<$Res>
    implements $TopUpStateCopyWith<$Res> {
  factory _$$TopUpStateImplCopyWith(
          _$TopUpStateImpl value, $Res Function(_$TopUpStateImpl) then) =
      __$$TopUpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? isLoading, dynamic isSuccess, int? selectedAmount, String? error});
}

/// @nodoc
class __$$TopUpStateImplCopyWithImpl<$Res>
    extends _$TopUpStateCopyWithImpl<$Res, _$TopUpStateImpl>
    implements _$$TopUpStateImplCopyWith<$Res> {
  __$$TopUpStateImplCopyWithImpl(
      _$TopUpStateImpl _value, $Res Function(_$TopUpStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isSuccess = freezed,
    Object? selectedAmount = freezed,
    Object? error = freezed,
  }) {
    return _then(_$TopUpStateImpl(
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSuccess: freezed == isSuccess ? _value.isSuccess! : isSuccess,
      selectedAmount: freezed == selectedAmount
          ? _value.selectedAmount
          : selectedAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TopUpStateImpl implements _TopUpState {
  const _$TopUpStateImpl(
      {this.isLoading, this.isSuccess, this.selectedAmount, this.error});

  @override
  final bool? isLoading;
  @override
  final dynamic isSuccess;
  @override
  final int? selectedAmount;
  @override
  final String? error;

  @override
  String toString() {
    return 'TopUpState(isLoading: $isLoading, isSuccess: $isSuccess, selectedAmount: $selectedAmount, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopUpStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other.isSuccess, isSuccess) &&
            (identical(other.selectedAmount, selectedAmount) ||
                other.selectedAmount == selectedAmount) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(isSuccess), selectedAmount, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopUpStateImplCopyWith<_$TopUpStateImpl> get copyWith =>
      __$$TopUpStateImplCopyWithImpl<_$TopUpStateImpl>(this, _$identity);
}

abstract class _TopUpState implements TopUpState {
  const factory _TopUpState(
      {final bool? isLoading,
      final dynamic isSuccess,
      final int? selectedAmount,
      final String? error}) = _$TopUpStateImpl;

  @override
  bool? get isLoading;
  @override
  dynamic get isSuccess;
  @override
  int? get selectedAmount;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$TopUpStateImplCopyWith<_$TopUpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
