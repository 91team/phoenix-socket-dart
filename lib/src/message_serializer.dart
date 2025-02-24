import 'dart:async';
import 'dart:convert';

import 'message.dart';

/// Default class to serialize [Message] instances to JSON.
class MessageSerializer {
  MessageSerializer._();

  /// Default constructor returning the singleton instance of this class.
  factory MessageSerializer() => _instance ??= MessageSerializer._();

  static MessageSerializer? _instance;

  /// Yield a [FutureOr<Message>] from some raw string arriving
  /// from a websocket.
  FutureOr<Message> decode(String rawData) {
    return Message.fromJson(jsonDecode(rawData));
  }

  /// Given a [Message], return the raw string that would be sent through
  /// a websocket.
  FutureOr<String> encode(Message message) {
    return jsonEncode(message.encode());
  }
}
