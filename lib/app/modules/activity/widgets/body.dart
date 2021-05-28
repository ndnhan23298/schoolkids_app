import 'package:doan/app/modules/activity/controllers/activity.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doan/app/theme/color_theme.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ActivityController>(
        init: Get.find(),
        builder: (controller) {
          return Padding(
              padding: const EdgeInsets.all(kDefaultPadding * 1.5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Thêm hoạt động",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        width: Get.width,
                        // height: Get.height,
                        padding: const EdgeInsets.all(kDefaultPadding * 1.5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 2, color: kPrimaryColor)),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name Activity',
                                  style: TextStyle(
                                      color: kPrimaryColor, fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                TextField(
                                  controller: controller.nameActivity.value,
                                  decoration: InputDecoration(
                                    isCollapsed: true,
                                    contentPadding:
                                        EdgeInsets.all(kDefaultPadding * 1.2),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kPrimaryColor)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kPrimaryColor)),
                                  ),
                                ),
                                SizedBox(height: 15),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Content',
                                  style: TextStyle(
                                      color: kPrimaryColor, fontSize: 16),
                                ),
                                SizedBox(height: 5),
                                TextField(
                                  controller: controller.content.value,
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                    isCollapsed: true,
                                    contentPadding:
                                        EdgeInsets.all(kDefaultPadding * 1.2),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kPrimaryColor)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: kPrimaryColor)),
                                  ),
                                ),
                                SizedBox(height: 15),
                              ],
                            ),
                            SizedBox(
                              width: Get.width,
                              height: 55,
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                color: kPrimaryColor,
                                child: Text(
                                  "SAVE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  controller.onSave();
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ));
        });
  }
}
