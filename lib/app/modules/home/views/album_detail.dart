import 'package:doan/app/modules/home/controllers/home.controller.dart';
import 'package:doan/app/theme/color_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailAlbumView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: Get.find(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              elevation: 0,
              toolbarHeight: 70,
              backgroundColor: kPrimaryColor,
              title: Text(
                "ALBUM",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                  itemCount: controller.album.value.images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: new BorderRadius.circular(10.0),
                      child: Image.network(
                        "${controller.album.value.images[index]}",
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: kPrimaryColor,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                controller.upLoadPhoto();
              },
            ),
          );
        });
  }
}
