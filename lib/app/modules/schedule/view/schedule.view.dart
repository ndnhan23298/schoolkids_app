import 'package:doan/app/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';
import 'package:get/get.dart';

class ScheduleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        title: Text(
          "Tài Khoản",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
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
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Time period", style: TextStyle(
                        color: Colors.white,
                        fontSize: 25
                      ),),
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text("FROM", style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),),
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
                            print(dateTime);
                          },
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text("TO", style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),),
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
                            print(dateTime);
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: Get.width,
                height: 250,
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                // height: 300,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(4),
                child: TextField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  decoration: InputDecoration.collapsed(hintText: "Enter your text here"),
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
                    // Get.toNamed(Routes.PROFILE);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
