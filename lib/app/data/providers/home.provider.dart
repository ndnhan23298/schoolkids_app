import 'dart:io';

import 'package:doan/app/data/models/album.model.dart';
import 'package:doan/app/utils/endpoints.dart';
import 'package:doan/app/utils/http_utils.dart';
import 'package:get/get.dart';

class HomeProvider extends GetConnect {
  Future<AlbumModel> getAlbum(String classId) async {
    try {
      final response = await HttpHelper.get("${Endpoint.ALBUM}/$classId");
      if (response != null) {
        return AlbumModel.fromJson(response.body);
      }
      return null;
    } catch (e) {
      return null;
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

  Future<String> firebase(String deviceToken) async {
    try {
      final response = await HttpHelper.post("${Endpoint.FIREBASE}", {
        "token": deviceToken
      });

      print(response.body);

      if(response != null){
        return response.body;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<bool> updateAlbum(String albumId,String path) async {
    try {
      final data = {
        "images" : [
          path
        ]
      };
      final response = await HttpHelper.put("${Endpoint.UPDATE_ALBUM}/$albumId", data);
      if(response != null){
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
