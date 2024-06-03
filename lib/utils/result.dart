import 'package:fitness_app/utils/exceptions.dart';
import 'package:fpdart/fpdart.dart';

typedef Result<T> = Either<T, Exception>;
typedef ApiResult<T> = Either<T, ApiException>;
