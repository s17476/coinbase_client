import 'package:coinbase_client/features/coinbase/data/datasources/coinbase_remote_datasource.dart';
import 'package:coinbase_client/features/coinbase/domain/entities/request_message.dart';
import 'package:dartz/dartz.dart';
import 'package:coinbase_client/features/core/errors/failure.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/coinbase_repository.dart';

@LazySingleton(as: CoinbaseRepository)
class CoinbaseRepositoryImpl extends CoinbaseRepository {
  final CoinbaseRemoteDatasource _coinbaseRemoteDatasource;

  CoinbaseRepositoryImpl(this._coinbaseRemoteDatasource);

  @override
  Future<Either<Failure, Stream>> getMessageStream() async {
    try {
      final messageStream = await _coinbaseRemoteDatasource.getMessageStream();
      return right(messageStream);
    } catch (e) {
      return Left(Failure.general(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> subscribe({String jsonMessage = ''}) async {
    try {
      await _coinbaseRemoteDatasource.subscribe(RequestMessage.initial());
      return right(unit);
    } catch (e) {
      return Left(Failure.general(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> unsubscribe() async {
    try {
      await _coinbaseRemoteDatasource.unsubscribe(RequestMessage.initial());
      return right(unit);
    } catch (e) {
      return Left(Failure.general(message: e.toString()));
    }
  }
}
