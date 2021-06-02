import 'dart:async';
import 'dart:io';
import 'package:doan/app/data/models/chat.model.dart';
import 'package:doan/app/data/models/user.model.dart';
import 'package:doan/app/data/repositories/chat.repository.dart';
import 'package:doan/app/services/socket.service.dart';
import 'package:doan/app/utils/keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatController extends GetxController {
  final ChatRepository repository;

  ChatController({@required this.repository})
      : assert(repository != null);

  static ChatController get to => Get.find<ChatController>();

  RxList<UserModel> users = RxList<UserModel>([]);
  RxList<MessageModel> messages = RxList<MessageModel>([]);
  RxBool isLoading = RxBool(false);
  Rx<TextEditingController> textChatController = TextEditingController().obs;

  File _image;
  final picker = ImagePicker();
  final store = GetStorage();

  IO.Socket socket;

  @override
  void onInit() async {
    _getListUser();
    String token = store.read(AppStorageKey.ACCESS_TOKEN);
    if ( SocketService.socket != null) {
      socket = SocketService.socket;
    } else {
      socket = new SocketService(token).getSocketClient();
    }

    socket.on('message', (data){
      messages.insert(0,MessageModel.fromJson(data));
      update();
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() async {
    super.onClose();
  }

  Future<void> _getListUser() async {
    try {
      isLoading.value = true;
      update();
      await repository.getListUser().then((response) {
        isLoading.value = false;
        if (response != null) {
          users.addAll(response);
        } else {
          // TODO: handle
        }
        update();
      });
    } catch (e) {
      isLoading.value = false;
      update();
    }
  }


  Future<void> getListMessage(UserModel user) async {
    messages.clear();
    try {
      isLoading.value = true;
      update();
      await repository.getListMessage(user.id).then((response) {
        isLoading.value = false;
        if (response != null) {
          messages.addAll(response);
        } else {
          // TODO: handle
        }
        update();
      });
    } catch (e) {
      isLoading.value = false;
      update();
    }
  }

  Future<void> onSendMessageText(String text) async{
    MessageModel messageModel = MessageModel();
    MessageSend messageSend = MessageSend(
      target: Get.arguments,
      content: text,
      type: "text"
    );
    if(messageSend != null){
      onSend(messageSend);
    }
  }

  void onSentMessagePhoto() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if(pickedFile != null){
      _image = File(pickedFile.path);
      try{
        await repository.upLoadPhoto(_image).then((response){
          if(response != null){
            MessageSend messageSend = MessageSend(
                target: Get.arguments,
                content: response,
                type: "img"
            );
            onSend(messageSend);
          }
        });
      }catch(e){
        print('No image selected.');
      }
    }
  }

  Future<void> onSend(MessageSend messageSend) async{
    try{
      await repository.sentMessage(messageSend);
    }catch(e){

    }
  }
}
