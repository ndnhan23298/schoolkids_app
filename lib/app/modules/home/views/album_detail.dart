import 'package:doan/app/modules/home/controllers/home.controller.dart';
import 'package:doan/app/modules/navigation/views/navigation.view.dart';
import 'package:doan/app/theme/color_theme.dart';
import 'package:doan/app/utils/keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DetailAlbumView extends StatelessWidget {
  final _store = GetStorage();

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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                  itemCount: controller.albumDetail.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = controller.albumDetail[index];
                    return GestureDetector(
                      onTap: () {
                        Get.dialog(
                          Dialog(
                            insetPadding: EdgeInsets.all(10),
                            child: Container(
                              width: Get.width,
                              child: Image.network(
                                "$item",
                              ),
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(10.0),
                        child: Image.network(
                          "$item",
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
            ),
            floatingActionButton: _store.read(AppStorageKey.studentId) == null
                ? FloatingActionButton(
              backgroundColor: kPrimaryColor,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                controller.upLoadPhoto();
              },
            )
                : SizedBox(),
            bottomNavigationBar: NavigationView(),
          );
        });
  }
}
