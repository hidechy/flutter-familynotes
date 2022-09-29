// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RouteException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pathNotFound,
    required TResult Function() invalidPath,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? pathNotFound,
    TResult Function()? invalidPath,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pathNotFound,
    TResult Function()? invalidPath,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoutePathNotFoundException value) pathNotFound,
    required TResult Function(RouterInvalidPathException value) invalidPath,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoutePathNotFoundException value)? pathNotFound,
    TResult Function(RouterInvalidPathException value)? invalidPath,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoutePathNotFoundException value)? pathNotFound,
    TResult Function(RouterInvalidPathException value)? invalidPath,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteExceptionCopyWith<$Res> {
  factory $RouteExceptionCopyWith(
          RouteException value, $Res Function(RouteException) then) =
      _$RouteExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$RouteExceptionCopyWithImpl<$Res>
    implements $RouteExceptionCopyWith<$Res> {
  _$RouteExceptionCopyWithImpl(this._value, this._then);

  final RouteException _value;
  // ignore: unused_field
  final $Res Function(RouteException) _then;
}

/// @nodoc
abstract class _$$RoutePathNotFoundExceptionCopyWith<$Res> {
  factory _$$RoutePathNotFoundExceptionCopyWith(
          _$RoutePathNotFoundException value,
          $Res Function(_$RoutePathNotFoundException) then) =
      __$$RoutePathNotFoundExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RoutePathNotFoundExceptionCopyWithImpl<$Res>
    extends _$RouteExceptionCopyWithImpl<$Res>
    implements _$$RoutePathNotFoundExceptionCopyWith<$Res> {
  __$$RoutePathNotFoundExceptionCopyWithImpl(
      _$RoutePathNotFoundException _value,
      $Res Function(_$RoutePathNotFoundException) _then)
      : super(_value, (v) => _then(v as _$RoutePathNotFoundException));

  @override
  _$RoutePathNotFoundException get _value =>
      super._value as _$RoutePathNotFoundException;
}

/// @nodoc

class _$RoutePathNotFoundException extends RoutePathNotFoundException {
  const _$RoutePathNotFoundException() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoutePathNotFoundException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pathNotFound,
    required TResult Function() invalidPath,
  }) {
    return pathNotFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? pathNotFound,
    TResult Function()? invalidPath,
  }) {
    return pathNotFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pathNotFound,
    TResult Function()? invalidPath,
    required TResult orElse(),
  }) {
    if (pathNotFound != null) {
      return pathNotFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoutePathNotFoundException value) pathNotFound,
    required TResult Function(RouterInvalidPathException value) invalidPath,
  }) {
    return pathNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoutePathNotFoundException value)? pathNotFound,
    TResult Function(RouterInvalidPathException value)? invalidPath,
  }) {
    return pathNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoutePathNotFoundException value)? pathNotFound,
    TResult Function(RouterInvalidPathException value)? invalidPath,
    required TResult orElse(),
  }) {
    if (pathNotFound != null) {
      return pathNotFound(this);
    }
    return orElse();
  }
}

abstract class RoutePathNotFoundException extends RouteException {
  const factory RoutePathNotFoundException() = _$RoutePathNotFoundException;
  const RoutePathNotFoundException._() : super._();
}

/// @nodoc
abstract class _$$RouterInvalidPathExceptionCopyWith<$Res> {
  factory _$$RouterInvalidPathExceptionCopyWith(
          _$RouterInvalidPathException value,
          $Res Function(_$RouterInvalidPathException) then) =
      __$$RouterInvalidPathExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RouterInvalidPathExceptionCopyWithImpl<$Res>
    extends _$RouteExceptionCopyWithImpl<$Res>
    implements _$$RouterInvalidPathExceptionCopyWith<$Res> {
  __$$RouterInvalidPathExceptionCopyWithImpl(
      _$RouterInvalidPathException _value,
      $Res Function(_$RouterInvalidPathException) _then)
      : super(_value, (v) => _then(v as _$RouterInvalidPathException));

  @override
  _$RouterInvalidPathException get _value =>
      super._value as _$RouterInvalidPathException;
}

/// @nodoc

class _$RouterInvalidPathException extends RouterInvalidPathException {
  const _$RouterInvalidPathException() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouterInvalidPathException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pathNotFound,
    required TResult Function() invalidPath,
  }) {
    return invalidPath();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? pathNotFound,
    TResult Function()? invalidPath,
  }) {
    return invalidPath?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pathNotFound,
    TResult Function()? invalidPath,
    required TResult orElse(),
  }) {
    if (invalidPath != null) {
      return invalidPath();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoutePathNotFoundException value) pathNotFound,
    required TResult Function(RouterInvalidPathException value) invalidPath,
  }) {
    return invalidPath(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RoutePathNotFoundException value)? pathNotFound,
    TResult Function(RouterInvalidPathException value)? invalidPath,
  }) {
    return invalidPath?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoutePathNotFoundException value)? pathNotFound,
    TResult Function(RouterInvalidPathException value)? invalidPath,
    required TResult orElse(),
  }) {
    if (invalidPath != null) {
      return invalidPath(this);
    }
    return orElse();
  }
}

abstract class RouterInvalidPathException extends RouteException {
  const factory RouterInvalidPathException() = _$RouterInvalidPathException;
  const RouterInvalidPathException._() : super._();
}
