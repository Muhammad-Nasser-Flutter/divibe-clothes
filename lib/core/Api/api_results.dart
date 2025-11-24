import 'package:cloth_ecommerce/core/Errors/failures.dart';

class ApiResult<T> {
  final T? data;
  final Failure? failure;

  // final String? message;
  final bool isSuccess;
  bool get isFailure => !isSuccess;

  const ApiResult._({this.data, this.failure, required this.isSuccess}) : assert(isSuccess || failure != null);

  factory ApiResult.success(T data) {
    return ApiResult._(data: data, isSuccess: true);
  }

  factory ApiResult.failure(Failure failure) {
    return ApiResult._(failure: failure, isSuccess: false);
  }
}
