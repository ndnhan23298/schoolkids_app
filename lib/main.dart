import 'dart:io';

import 'package:doan/app/routes/app_pages.dart';
import 'package:doan/app/services/socket.service.dart';
import 'package:doan/app/utils/keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final store = GetStorage();
  String token = store.read(AppStorageKey.ACCESS_TOKEN);

  if (token != null) {
    new SocketService(token);
  }

  runApp(

    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.fadeIn,
    ),
  );
}
