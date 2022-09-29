import 'package:freezed_annotation/freezed_annotation.dart';

part 'exception.freezed.dart';

@freezed
class RouteException with _$RouteException implements Exception {
  const factory RouteException.pathNotFound() = RoutePathNotFoundException;

  const factory RouteException.invalidPath() = RouterInvalidPathException;

  const RouteException._();

  @override
  String toString() => when(
        pathNotFound: () => '指定したパスにページが存在していません',
        invalidPath: () => 'パスが正しく指定されていません',
      );
}
