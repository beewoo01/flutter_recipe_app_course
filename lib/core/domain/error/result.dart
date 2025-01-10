import 'package:freezed_annotation/freezed_annotation.dart';
import 'error.dart';

part 'result.freezed.dart';

@freezed
class Result<D, E extends Error> with _$Result<D, E> {
  const factory Result.success(D data) = ResultSuccess;
  const factory Result.error(E error) = ResultError;
}