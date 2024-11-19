import 'package:homei/core/error/exceptions.dart';

import 'failure.dart';

Failure mapExceptionToFailure(Exception e) {
  if (e is ServerException) {
    return ServerFailure(e.message);
  }
  return Failure('Unexpected Error');
}
