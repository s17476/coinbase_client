import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@lazySingleton
class CoinbaseLocalDatasource {
  final Database _database;

  CoinbaseLocalDatasource(
    this._database,
  );
}
