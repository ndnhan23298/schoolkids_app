import 'package:doan/app/modules/health_management/controllers/health_management.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doan/app/routes/app_pages.dart';
import 'package:doan/app/theme/color_theme.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<HealthManagementController>(
          init: Get.find(),
          builder: (controller) {
            return Column(
              children: [
                Container(
                  width: Get.width,
                  height: 75,
                  child: Stack(
                    children: [
                      Container(
                        width: Get.width,
                        height: 50,
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding * 2),
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding * 1.5),
                          width: Get.width,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 10),
                                    blurRadius: 50,
                                    color: kPrimaryColor.withOpacity(0.23))
                              ]),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: "Search",
                                      hintStyle: TextStyle(
                                        color: kPrimaryColor,
                                      )),
                                ),
                              ),
                              GestureDetector(
                                child: Icon(
                                  Icons.search_rounded,
                                  color: kPrimaryColor,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.studentByClass.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Container(
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
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: kPrimaryColor,
                                child: Image.asset("assets/images/user_2.png"),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  controller.studentByClass[index].firstName + ' ' + controller.studentByClass[index].lastName,
                                  style: TextStyle(color: kPrimaryColor, fontSize: 18),
                                ),
                              ),
                              GestureDetector(
                                child: Icon(
                                  Icons.arrow_right,
                                  size: 30,
                                  color: kPrimaryColor,
                                ),
                                onTap: (){
                                  Get.toNamed(Routes.DETAIL_HEALTH_STUDENT);
                                  controller.getHealthStudent(controller.studentByClass[index].id);
                                },
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          });
  }
}
