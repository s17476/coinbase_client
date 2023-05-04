import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

@module
abstract class SharedPreferencesService {
  @lazySingleton
  WebSocketChannel get chanel => WebSocketChannel.connect(
        Uri.parse('wss://ws-feed.pro.coinbase.com'),
      );
}

@module
abstract class SQLiteService {
  @preResolve
  Future<Database> get database async => openDatabase(
        join(await getDatabasesPath(), 'doggie_db.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
          );
        },
        version: 1,
      );
}
