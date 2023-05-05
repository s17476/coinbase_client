import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';

enum ResponseType {
  subscription('subscription'),
  subscriptions('subscriptions'),
  ticker('ticker'),
  heartbeat('heartbeat'),
  status('status');

  final String name;

  const ResponseType(this.name);
}

abstract class CoinbaseRepository {
  Future<Either<Failure, Unit>> subscribe();
  Future<Either<Failure, Stream>> getMessageStream();
  Future<Either<Failure, Unit>> unsubscribe();
}
