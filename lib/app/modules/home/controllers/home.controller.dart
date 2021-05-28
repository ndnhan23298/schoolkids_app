import 'dart:io';

import 'package:doan/app/data/models/album.model.dart';
import 'package:doan/app/data/repositories/home.repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
class HomeController extends GetxController {

  final HomeRepository repository;

  HomeController({@required this.repository})
      : assert(repository != null);

  static HomeController get to => Get.find<HomeController>();
  RxBool isLoading = false.obs;
  Rx<AlbumModel> album = AlbumModel().obs;

  File _image;
  final picker = ImagePicker();

  String classId;
  String path;

  @override
  void onInit() async {
    classId = Get.arguments;
    if(classId != null){
      getAlbum(classId);
    }
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

  void getAlbum(String classId) async {
    isLoading.value = true;
    update();
    await repository.getAlbum(classId).then((response) {
      isLoading.value = false;
      if (response != null) {
        album.value = response;
        print(album.value.images[0]);
      } else {
        print("null");
        // TODO: handle
      }
      update();
    });
  }

  Future upLoadPhoto() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if(pickedFile != null){
      _image = File(pickedFile.path);
      try{
        await repository.upLoadPhoto(_image).then((response){
         path = response;
         if(path != null){
           updateAlbum();
         }
        });
      }catch(e){
        print('No image selected.');
      }
    }
  }

  void updateAlbum() async {
    update();
    await repository.updateAlbum(album.value.id, path).then((response) {
      if (response != null) {
        print(response);
      } else {
        print("null");
        // TODO: handle
      }
      update();
    });
  }

}
