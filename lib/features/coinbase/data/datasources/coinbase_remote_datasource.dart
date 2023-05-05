import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../domain/entities/channel.dart';
import '../../domain/entities/request_message.dart';

@lazySingleton
class CoinbaseRemoteDatasource {
  final WebSocketChannel _webSocketChannel;

  CoinbaseRemoteDatasource(this._webSocketChannel);

  Future<void> subscribe(RequestMessage message) async {
    _webSocketChannel.sink.add(message.toJsonString());
    Future.delayed(
      const Duration(seconds: 3),
      () => _webSocketChannel.sink.add(
        message.copyWith(channels: [
          {"name": "status"},
          Channel(name: 'heartbeat', productIds: ['ETH-PLN'])
        ]).toJsonString(),
      ),
    );
  }

  Future<Stream> getMessageStream() async => _webSocketChannel.stream;

  Future<void> unsubscribe(RequestMessage message) async =>
      _webSocketChannel.sink.add(message.toJsonString());
}
