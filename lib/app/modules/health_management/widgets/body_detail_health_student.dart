import 'package:doan/app/modules/health_management/controllers/health_management.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doan/app/theme/color_theme.dart';

class BodyDetailHealthStudent extends StatelessWidget {
  const BodyDetailHealthStudent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HealthManagementController>(
        init: Get.find(),
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.studentHealth.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding),
                margin: const EdgeInsets.only(
                    top: kDefaultPadding * 2,
                    left: kDefaultPadding * 2,
                    right: kDefaultPadding * 2),
                width: Get.width,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 0),
                          color: kPrimaryColor.withOpacity(0.3),
                          blurRadius: 7),
                    ]),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: RichText(
                              text: TextSpan(
                                  text: "Height: ",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: controller.studentHealth[index].height,
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                        ))
                                  ]),
                            )),
                        Expanded(
                            flex: 1,
                            child: RichText(
                              text: TextSpan(
                                  text: "Weight: ",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: controller.studentHealth[index].weight,
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                        ))
                                  ]),
                            )),
                        Expanded(
                            flex: 1,
                            child: RichText(
                              text: TextSpan(
                                  text: "Date: ",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: controller.studentHealth[index].checkedAt,
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                        ))
                                  ]),
                            )),
                      ],
                    ),
                    SizedBox(height: 5),
                    Expanded(
                        flex: 1,
                        child: RichText(
                          text: TextSpan(
                              text: "Note: ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                    text: controller.studentHealth[index].note,
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                    )
                                )
                              ]
                          ),
                        )
                    ),
                  ],
                ),
              );
            },
          );
        });

  }
}
