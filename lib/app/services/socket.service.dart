import 'package:doan/app/utils/endpoints.dart';
import 'package:doan/app/utils/keys.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
   static IO.Socket socket;

  SocketService(String token) {
    init(token);
  }

  IO.Socket getSocketClient() {
    return socket;
  }

  static init(String token) {
    socket = IO.io(Endpoint.API, <String, dynamic>{
      'transports': ['websocket'],
      'extraHeaders': {'token': token},
      'autoConnect': true,
    });

    socket.onConnect((data) {
      socket.emit('register', { "token" : token });
    });
  }
}
