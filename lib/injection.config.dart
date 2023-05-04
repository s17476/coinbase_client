// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sqflite/sqflite.dart' as _i3;
import 'package:web_socket_channel/web_socket_channel.dart' as _i4;

import 'injectable_modules.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final sQLiteService = _$SQLiteService();
    final sharedPreferencesService = _$SharedPreferencesService();
    await gh.factoryAsync<_i3.Database>(
      () => sQLiteService.database,
      preResolve: true,
    );
    gh.lazySingleton<_i4.WebSocketChannel>(
        () => sharedPreferencesService.chanel);
    return this;
  }
}

class _$SharedPreferencesService extends _i5.SharedPreferencesService {}

class _$SQLiteService extends _i5.SQLiteService {}
