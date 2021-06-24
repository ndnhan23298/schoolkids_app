import 'package:doan/app/modules/activity/controllers/activity.controller.dart';
import 'package:doan/app/modules/navigation/views/navigation.view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doan/app/theme/color_theme.dart';

class ParticipantView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: kPrimaryColor,
          title: Text("Danh Sách Tham Gia")),
      body:
      GetBuilder<ActivityController>(
          init: Get.find(),
          builder: (controller) {
            return ListView.builder(
                itemCount: controller.participants.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.only(
                        top: kDefaultPadding * 2,
                        left: kDefaultPadding * 2,
                        right: kDefaultPadding * 2),
                    width: Get.width,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 0),
                              color: kPrimaryColor.withOpacity(0.3),
                              blurRadius: 7),
                        ]),
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          child: Image.asset('assets/images/calendar.png'),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Obx(
                                () => Text(
                              controller.participants[index].studentID.firstName +
                                  ' ' +
                                  controller.participants[index].studentID.lastName,
                              style: TextStyle(color: kPrimaryColor, fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          }),

      bottomNavigationBar: NavigationView(),
    );
  }
}
