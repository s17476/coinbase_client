// ignore_for_file: invalid_annotation_target, unused_element

import 'dart:convert';

import 'package:coinbase_client/features/coinbase/domain/entities/channel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_message.freezed.dart';
part 'request_message.g.dart';

@freezed
class RequestMessage with _$RequestMessage {
  const RequestMessage._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RequestMessage({
    required String type,
    List<String>? productIds,
    required List<dynamic> channels,
  }) = _RequestMessage;

  factory RequestMessage.fromJson(Map<String, dynamic> json) =>
      _$RequestMessageFromJson(json);

  factory RequestMessage.initial() => RequestMessage(
        type: 'subscribe',
        channels: [
          Channel.initial(),
        ],
      );

  String toJsonString() => jsonEncode(toJson());
}
