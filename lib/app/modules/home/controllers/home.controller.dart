import 'dart:io';

import 'package:doan/app/data/models/album.model.dart';
import 'package:doan/app/data/repositories/home.repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:doan/app/utils/keys.dart';

class HomeController extends GetxController {
  final _store = GetStorage();
  final HomeRepository repository;

  HomeController({@required this.repository})
      : assert(repository != null);

  static HomeController get to => Get.find<HomeController>();
  RxBool isLoading = false.obs;
  Rx<AlbumModel> album = AlbumModel().obs;
  String nameAlbum;
  RxList<String> albumDetail = RxList<String>([]);

  File _image;
  final picker = ImagePicker();

  String classId;
  String path;

  @override
  void onInit() async {
    classId =_store.read(AppStorageKey.classId);
    if(classId != null){
      await getAlbum(classId);
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

  Future<void> getAlbum(String classId) async {
    isLoading.value = true;
    update();
    await repository.getAlbum(classId).then((response) {
      isLoading.value = false;
      update();
      if (response != null) {
        album.value = response;
        nameAlbum = album.value.name;
        albumDetail.addAll(album.value.images);
        List<String> listImg = [null, null, null];
       for(int i = 0 ; i < (album.value.images.length < 3 ? album.value.images.length : 3) ; i++ ){
         listImg[i] = album.value.images[i];
       }
       album.value.images.clear();
       album.value.images.addAll(listImg);
      } else {
      }
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
