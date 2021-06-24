import 'package:doan/app/modules/health_management/controllers/health_management.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doan/app/theme/color_theme.dart';

class AddDetailHealth extends StatelessWidget {
  const AddDetailHealth({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HealthManagementController>(
        init: Get.find(),
        builder: (controller) {
          return Dialog(
            backgroundColor: Colors.white.withOpacity(0),
            insetPadding: EdgeInsets.all(kDefaultPadding * 2),
            child: Container(
              width: Get.width,
              // height: 460,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: kPrimaryColor,
                      width: 2
                  )
              ),
              padding: const EdgeInsets.all(kDefaultPadding * 2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Cập Nhật Sức Khoẻ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor),
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chiều cao',
                        style: TextStyle(color: kPrimaryColor, fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        controller: controller.height.value,
                        decoration: InputDecoration(
                          isCollapsed: true,
                          contentPadding: EdgeInsets.all(kDefaultPadding * 1.2),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: kPrimaryColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: kPrimaryColor)),
                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cân nặng',
                        style: TextStyle(color: kPrimaryColor, fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        controller: controller.weight.value,
                        decoration: InputDecoration(
                          isCollapsed: true,
                          contentPadding: EdgeInsets.all(kDefaultPadding * 1.2),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: kPrimaryColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: kPrimaryColor)),
                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chi tiết',
                        style: TextStyle(color: kPrimaryColor, fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        controller: controller.note.value,
                        maxLines: 3,
                        decoration: InputDecoration(
                          isCollapsed: true,
                          contentPadding: EdgeInsets.all(kDefaultPadding * 1.2),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: kPrimaryColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: kPrimaryColor)),
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
                      child: Text("Cập nhật", style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                      ),
                      onPressed: (){
                        controller.onSave();
                      },
                    ),
                  )

                ],
              ),
            ),
          );
        });

  }
}