import 'package:doan/app/utils/endpoints.dart';
import 'package:doan/app/utils/keys.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  static IO.Socket socket;

  SocketService(String token) {
    init(token);
    // listenEvent();
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
      socket.emit('register', { "token": token});
    });
  }
  //
  // void listenEvent() {
  //   socket. on('message', (data) {
  //     if (!SocketState.isInMessageScreen) {
  //       _showMyDialog();
  //     }
  //   });
  //
  //   socket.on('notification', (data) {
  //     _showMyDialog();
  //   });
  // }
  //
  // void _showToast(String message) {
  //   Fluttertoast.showToast(
  //       msg: message,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 10,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 16.0
  //   );
  // }
  //
  //
  // Future<void> _showMyDialog() async {
  //   return showDialog<void>(
  //     context: navigator.context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('AlertDialog Title'),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: const <Widget>[
  //               Text('This is a demo alert dialog.'),
  //               Text('Would you like to approve of this message?'),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('Approve'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
