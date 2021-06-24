import 'dart:io';

import 'package:doan/app/data/providers/home.provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:doan/app/data/models/album.model.dart';

class HomeRepository {
  final HomeProvider apiClient;
  HomeRepository({@required this.apiClient}) : assert(apiClient != null);
  Future<AlbumModel> getAlbum( String albumId) async {
    return apiClient.getAlbum(albumId);
  }

  Future<String> upLoadPhoto( File file) async {
    return apiClient.uploadPhoto(file);
  }

  Future<bool> updateAlbum(String albumId,String path) async {
    return apiClient.updateAlbum(albumId, path);
  }

  Future<String> firebase(String deviceToken) async {
    return apiClient.firebase(deviceToken);
  }
}