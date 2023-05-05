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

import 'features/coinbase/data/datasources/coinbase_local_datasource.dart'
    as _i5;
import 'features/coinbase/data/datasources/coinbase_remote_datasource.dart'
    as _i6;
import 'features/coinbase/data/repositories/coinbase_repository_impl.dart'
    as _i8;
import 'features/coinbase/domain/repositories/coinbase_repository.dart' as _i7;
import 'features/coinbase/presentation/providers/exchange_rate_provider.dart'
    as _i9;
import 'injectable_modules.dart' as _i10;

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
    gh.lazySingleton<_i5.CoinbaseLocalDatasource>(
        () => _i5.CoinbaseLocalDatasource(gh<_i3.Database>()));
    gh.lazySingleton<_i6.CoinbaseRemoteDatasource>(
        () => _i6.CoinbaseRemoteDatasource(gh<_i4.WebSocketChannel>()));
    gh.lazySingleton<_i7.CoinbaseRepository>(
        () => _i8.CoinbaseRepositoryImpl(gh<_i6.CoinbaseRemoteDatasource>()));
    gh.singleton<_i9.ExchangeRateProvider>(
        _i9.ExchangeRateProvider(gh<_i7.CoinbaseRepository>()));
    return this;
  }
}

class _$SharedPreferencesService extends _i10.SharedPreferencesService {}

class _$SQLiteService extends _i10.SQLiteService {}
