// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'result.freezed.dart';

// @freezed
// class Result<T> with _$Result<T> {
//   const factory Result.success(T value) = Success<T>;
//   const factory Result.failure(String error) = Failure<T>;
// }

abstract class Result<T> {
  const Result();

  factory Result.success(T value) = Success<T>;
  factory Result.failure(String error) = Failure<T>;

  R when<R>({
    required R Function(T value) success,
    required R Function(String error) failure,
  });
}

class Success<T> extends Result<T> {
  final T value;
  const Success(this.value);

  @override
  R when<R>({
    required R Function(T value) success,
    required R Function(String error) failure,
  }) {
    return success(value);
  }
}

class Failure<T> extends Result<T> {
  final String error;
  const Failure(this.error);

  @override
  R when<R>({
    required R Function(T value) success,
    required R Function(String error) failure,
  }) {
    return failure(error);
  }
}
