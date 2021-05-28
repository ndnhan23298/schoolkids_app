import 'dart:io';

import 'package:doan/app/data/models/chat.model.dart';
import 'package:doan/app/data/models/user.model.dart';
import 'package:doan/app/utils/endpoints.dart';
import 'package:doan/app/utils/http_utils.dart';
import 'package:get/get.dart';

class ChatProvider extends GetConnect {
  Future<List<UserModel>> getListUser() async {
    try {
      final response = await HttpHelper.get(Endpoint.USER);
      if (response != null) {
        var result = response.body
            .map<UserModel>(
                (item) => UserModel.fromJson(item))
            .toList();
        return result;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<MessageModel>> getListMessage(String id) async {
    try {
      final response = await HttpHelper.get("${Endpoint.MESSAGE}/$id");
      if (response != null) {
        final result = response.body.map<MessageModel>((_) =>
          MessageModel.fromJson(_)).toList();
        return result;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<bool> sentMessage(MessageSend messageSend) async {
    try {
      final response = await HttpHelper.post("${Endpoint.SEND_MESSAGE}", messageSend);
      if (response != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<String> uploadPhoto(File file) async {
    try {
      final response = await HttpHelper.uploadFile("${Endpoint.UPLOAD_PHOTO}", file: file);
      if(response != null){
        return response.body;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
