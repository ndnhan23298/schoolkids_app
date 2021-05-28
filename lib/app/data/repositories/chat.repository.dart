import 'dart:io';

import 'package:dash_chat/dash_chat.dart';
import 'package:doan/app/data/models/chat.model.dart';
import 'package:doan/app/data/models/user.model.dart';
import 'package:doan/app/data/providers/chat.provider.dart';
import 'package:flutter/cupertino.dart';

class ChatRepository {
  final ChatProvider apiClient;
  ChatRepository({@required this.apiClient})
      : assert(apiClient != null);

  Future<List<UserModel>> getListUser() async {
    return await apiClient.getListUser();
  }

  Future<List<MessageModel>> getListMessage(String id) async {
    return await apiClient.getListMessage(id);
  }


  Future<bool> sentMessage(MessageSend messageSend) async {
    return await apiClient.sentMessage(messageSend);
  }

  Future<String> upLoadPhoto( File file) async {
    return apiClient.uploadPhoto(file);
  }
}