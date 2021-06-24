import 'package:doan/app/modules/health_management/controllers/health_management.controller.dart';
import 'package:doan/app/modules/navigation/views/navigation.view.dart';
import 'package:doan/app/utils/keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doan/app/modules/health_management/widgets/add_detail_health_student.dart';
import 'package:doan/app/modules/health_management/widgets/body_detail_health_student.dart';
import 'package:doan/app/theme/color_theme.dart';
import 'package:get_storage/get_storage.dart';

class DetailHealthStudentView extends StatelessWidget {
  final _store = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: kPrimaryColor,
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back,
              size: 25,
            ),
            onTap: () {
              Get.back();
            },
          ),
          title: GetBuilder<HealthManagementController>(
            init: Get.find(),
            builder: (controller) {
              return Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Image.asset("assets/images/user_2.png"),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(width: 15),
                      if (controller.studentDetail != null)
                        Text(
                            "${controller.studentDetail.firstName} ${controller.studentDetail.lastName}"),
                    ],
                  ),
                ],
              );
            },
          )),
      body: BodyDetailHealthStudent(),
      floatingActionButton: _store.read(AppStorageKey.studentId) == null
          ? FloatingActionButton(
              backgroundColor: kPrimaryColor,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Get.dialog(
                  AddDetailHealth(),
                );
              },
            )
          : SizedBox(),
      bottomNavigationBar: NavigationView(),
    );
  }
}
