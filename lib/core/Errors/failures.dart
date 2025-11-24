import 'package:cloth_ecommerce/core/Errors/strings.dart';
import 'package:cloth_ecommerce/core/constant.dart';

abstract class Failure {
  final String message;
  const Failure({required this.message});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
  factory ServerFailure.fromJson(Map<String, dynamic>? json) {
    printDebug("In Failure");
    return ServerFailure(
      message: json?["error"] ?? GENERALL_FAILURE_MESSAGE,
    );
  }
}

class EmptyListFailure extends Failure {
  const EmptyListFailure({
    required super.message,
  });
  factory EmptyListFailure.fromJson(Map<String, dynamic>? json) {
    return EmptyListFailure(
      message: json?["error"] ?? NO_RESULT_FOUND_FAILURE,
    );
  }
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure({
    required super.message,
  });
}

class OfflineFailure extends Failure {
  const OfflineFailure() : super(message: OFFLINE_FAILURE_MESSAGE);
}
