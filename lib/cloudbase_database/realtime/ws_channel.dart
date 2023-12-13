/// original pub package: https://pub.dev/packages/cloudbase_database
/// author: https://cloudbase.net/ & lirongcong.bennett@gmail.com

import 'dart:async';
import 'dart:convert';
import 'dart:io';

enum WsReadyStatus { CONNECTING, OPEN, CLOSING, CLOSED }

class WSChannel {
  late String _wsUrl;
  WebSocket? _ws;
  // late WsReadyStatus _status;

  get readyState {
    if (_ws == null) {
      return WsReadyStatus.CLOSED;
    }

    switch (_ws!.readyState) {
      case WebSocket.open:
        return WsReadyStatus.OPEN;
      case WebSocket.closed:
        return WsReadyStatus.CLOSED;
      case WebSocket.closing:
        return WsReadyStatus.CLOSING;
      case WebSocket.connecting:
        return WsReadyStatus.CONNECTING;
      default:
        return WsReadyStatus.CLOSED;
    }
  }

  WSChannel(String url) {
    _wsUrl = url;
  }

  /// should set only once
  Future<void> setCallback(
    Function onOpen,
    Function onError,
    Function onClose,
    Function onMessage,
  ) async {
    try {
      _ws = await WebSocket.connect(_wsUrl, headers: {
        'origin': 'https://127.0.0.1',
      }); // todo 去掉origin头
    } catch (error) {
      onError(error);
      return;
    }

    var onData = (message) {
      onMessage(message);
    };
    var onDone = () {
      onClose(_ws!.closeCode, _ws!.closeReason);
    };

    _ws!.listen(onData, onError: onError, onDone: onDone);

    if (WebSocket.open == _ws!.readyState) {
      onOpen();
    }
  }

  void send(Map data) {
    if (_ws?.readyState == WebSocket.open) {
      _ws?.add(jsonEncode(data));
    }
  }

  void close(int code, String? reason) {
    _ws?.close(code, reason);
  }
}
