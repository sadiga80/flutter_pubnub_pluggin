import 'dart:async';

import 'package:flutter/services.dart';

class PubnubPlugin {
  String publishKey;
  String subscribeKey;
  String uuid;
  static var _onMessageReceived;
  static var _onStatusReceived;

  static const MethodChannel _channel = const MethodChannel('pubnub');
  static const EventChannel _messageChannel = const EventChannel('plugins.flutter.io/pubnub_message');
  static const EventChannel _statusChannel = const EventChannel('plugins.flutter.io/pubnub_status');

  Pubnub(String publishKey, String subscribeKey, {String uuid}) {
    this.publishKey = publishKey;
    this.subscribeKey = subscribeKey;
    this.uuid = uuid;

    var args = {
      'publishKey': publishKey,
      'subscribeKey': subscribeKey,
    };

    if(uuid != null) {
      args["uuid"] = uuid;
    }
    _channel.invokeMethod('create', args);
    // onCreate(args);
  }

  Future<String> get platformVersion async {
    var args = {
      'publishKey': publishKey,
      'subscribeKey': subscribeKey,
    };

    final String version = await _channel.invokeMethod('getPlatformVersion', args);
    return version;
  }

  /// Executed whenever the a message is received.
  Stream<Map> get onMessageReceived {
    if (_onMessageReceived == null) {
      _onMessageReceived = _messageChannel
          .receiveBroadcastStream()
          .map((dynamic event) => _parseMessage(event));
    }
    return _onMessageReceived;
  }
  /// Executed whenever the status changes.
  Stream<dynamic> get onStatusReceived {
    if (_onStatusReceived == null) {
      _onStatusReceived = _statusChannel
          .receiveBroadcastStream()
          .map((dynamic event) => _parseStatus(event));
    }
    return _onStatusReceived;
  }

  dynamic _parseMessage(message) {
    print(message);
    return message;
  }

  dynamic _parseStatus(status) {
    print(status);
    return status;
  }
}
