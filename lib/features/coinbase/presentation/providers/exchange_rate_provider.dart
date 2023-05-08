import 'dart:convert';

import 'package:coinbase_client/features/coinbase/domain/entities/currency.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/coinbase_repository.dart';

@singleton
class ExchangeRateProvider extends ChangeNotifier {
  final CoinbaseRepository _coinbaseRepository;

  bool _isLoading = true;
  String _errorMessage = '';

  ExchangeRateProvider(
    this._coinbaseRepository,
  ) {
    _subscribe();
    _listen();
  }

  void _subscribe() async {
    final failureOrUnit = await _coinbaseRepository.subscribe();
    await failureOrUnit.fold(
      (failure) async {
        _isLoading = false;
        _errorMessage = failure.message;
      },
      (r) async => _isLoading = false,
    );
    notifyListeners();
  }

  void _listen() async {
    final failureOrMessageStream = await _coinbaseRepository.getMessageStream();
    await failureOrMessageStream.fold(
      (failure) async => _errorMessage = failure.message,
      (messageStream) async => messageStream.listen((message) {
        final Map<String, dynamic> map = jsonDecode(message as String);
        // print(map['type']);
        // if (map['type'] == ResponseType.subscriptions.name) {
        //   print(map);
        // }
        if (map['type'] == ResponseType.status.name) {
          updateCurrencies(map['currencies'] as List);
        }
        // print(map);
      }),
    );
  }
}

void updateCurrencies(List maps) {
  List<Currency> currencies = [];
  maps.forEach((element) {
    currencies.add(Currency.fromJson(element));
  });
  print(currencies);
}
