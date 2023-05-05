// ignore_for_file: invalid_annotation_target, unused_element

import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel.freezed.dart';
part 'channel.g.dart';

@freezed
class Channel with _$Channel {
  const Channel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Channel({
    required String name,
    required List<String> productIds,
  }) = _Channel;

  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);

  factory Channel.initial() =>
      const Channel(name: 'ticker', productIds: ['ETH-EUR']);
}
