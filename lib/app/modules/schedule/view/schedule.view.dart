import 'package:doan/app/modules/navigation/views/navigation.view.dart';
import 'package:doan/app/modules/schedule/controller/schedule.controller.dart';
import 'package:doan/app/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';
import 'package:get/get.dart';

class ScheduleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime firstDay;
    DateTime lastDay;
    String content;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
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
        centerTitle: true,
        title: Text(
          "Xin nghỉ",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: GetBuilder<ScheduleController>(
        init: Get.find(),
        builder: (controller) {
          return Container(
            width: Get.width,
            height: Get.height,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // height: 300,
                    margin: const EdgeInsets.all(5),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                          child: Text(
                            "Thời gian nghỉ",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                "Từ ngày",
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              ),
                            ),
                            SizedBox(height: 20),
                            FlutterDatePickerTimeline(
                              selectedItemBackgroundColor: kPrimaryColor,
                              itemRadius: 100,
                              unselectedItemTextStyle:
                              TextStyle(color: kPrimaryColor),
                              startDate: DateTime(2020, 07, 01),
                              endDate: DateTime(2020, 12, 30),
                              initialSelectedDate: DateTime(2020, 07, 24),
                              onSelectedDateChange: (DateTime dateTime) {
                                firstDay = dateTime;
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Divider(
                            thickness: 1,
                            color: Colors.white,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              child: Text(
                                "Đến ngày",
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              ),
                            ),
                            SizedBox(height: 10),
                            FlutterDatePickerTimeline(
                              selectedItemBackgroundColor: kPrimaryColor,
                              itemRadius: 100,
                              unselectedItemTextStyle:
                              TextStyle(color: kPrimaryColor),
                              startDate: DateTime(2020, 07, 01),
                              endDate: DateTime(2020, 12, 30),
                              initialSelectedDate: DateTime(2020, 07, 24),
                              onSelectedDateChange: (DateTime dateTime) {
                                lastDay = dateTime;
                              },
                            ),
                            SizedBox(height: 15),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: Get.width,
                    height: 150,
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // height: 300,
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration.collapsed(
                        hintText: "Nhập nội dung",
                      ),
                      onChanged: (String str) {
                        content = str;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: Get.width,
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      color: kPrimaryColor,
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        dynamic data = {
                          "firstDay": firstDay.toString(),
                          "lastDay": lastDay.toString(),
                          "content": content,
                        };
                        controller.onSave(data);
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: NavigationView(),
    );
  }
}
