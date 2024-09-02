// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HistoryState {
  bool? get isLoading => throw _privateConstructorUsedError;
  dynamic get isSuccess => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<RechargeModel>? get rechargeHistory =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryStateCopyWith<HistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryStateCopyWith<$Res> {
  factory $HistoryStateCopyWith(
          HistoryState value, $Res Function(HistoryState) then) =
      _$HistoryStateCopyWithImpl<$Res, HistoryState>;
  @useResult
  $Res call(
      {bool? isLoading,
      dynamic isSuccess,
      String? error,
      List<RechargeModel>? rechargeHistory});
}

/// @nodoc
class _$HistoryStateCopyWithImpl<$Res, $Val extends HistoryState>
    implements $HistoryStateCopyWith<$Res> {
  _$HistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isSuccess = freezed,
    Object? error = freezed,
    Object? rechargeHistory = freezed,
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
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      rechargeHistory: freezed == rechargeHistory
          ? _value.rechargeHistory
          : rechargeHistory // ignore: cast_nullable_to_non_nullable
              as List<RechargeModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryStateImplCopyWith<$Res>
    implements $HistoryStateCopyWith<$Res> {
  factory _$$HistoryStateImplCopyWith(
          _$HistoryStateImpl value, $Res Function(_$HistoryStateImpl) then) =
      __$$HistoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? isLoading,
      dynamic isSuccess,
      String? error,
      List<RechargeModel>? rechargeHistory});
}

/// @nodoc
class __$$HistoryStateImplCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res, _$HistoryStateImpl>
    implements _$$HistoryStateImplCopyWith<$Res> {
  __$$HistoryStateImplCopyWithImpl(
      _$HistoryStateImpl _value, $Res Function(_$HistoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isSuccess = freezed,
    Object? error = freezed,
    Object? rechargeHistory = freezed,
  }) {
    return _then(_$HistoryStateImpl(
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSuccess: freezed == isSuccess ? _value.isSuccess! : isSuccess,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      rechargeHistory: freezed == rechargeHistory
          ? _value._rechargeHistory
          : rechargeHistory // ignore: cast_nullable_to_non_nullable
              as List<RechargeModel>?,
    ));
  }
}

/// @nodoc

class _$HistoryStateImpl implements _HistoryState {
  const _$HistoryStateImpl(
      {this.isLoading,
      this.isSuccess,
      this.error,
      final List<RechargeModel>? rechargeHistory})
      : _rechargeHistory = rechargeHistory;

  @override
  final bool? isLoading;
  @override
  final dynamic isSuccess;
  @override
  final String? error;
  final List<RechargeModel>? _rechargeHistory;
  @override
  List<RechargeModel>? get rechargeHistory {
    final value = _rechargeHistory;
    if (value == null) return null;
    if (_rechargeHistory is EqualUnmodifiableListView) return _rechargeHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HistoryState(isLoading: $isLoading, isSuccess: $isSuccess, error: $error, rechargeHistory: $rechargeHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other.isSuccess, isSuccess) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._rechargeHistory, _rechargeHistory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(isSuccess),
      error,
      const DeepCollectionEquality().hash(_rechargeHistory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryStateImplCopyWith<_$HistoryStateImpl> get copyWith =>
      __$$HistoryStateImplCopyWithImpl<_$HistoryStateImpl>(this, _$identity);
}

abstract class _HistoryState implements HistoryState {
  const factory _HistoryState(
      {final bool? isLoading,
      final dynamic isSuccess,
      final String? error,
      final List<RechargeModel>? rechargeHistory}) = _$HistoryStateImpl;

  @override
  bool? get isLoading;
  @override
  dynamic get isSuccess;
  @override
  String? get error;
  @override
  List<RechargeModel>? get rechargeHistory;
  @override
  @JsonKey(ignore: true)
  _$$HistoryStateImplCopyWith<_$HistoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
