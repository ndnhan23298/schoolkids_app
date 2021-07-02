import 'package:doan/app/modules/navigation/views/navigation.view.dart';
import 'package:doan/app/modules/schedule/controller/schedule.controller.dart';
import 'package:doan/app/theme/color_theme.dart';
import 'package:doan/app/utils/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ScheduleView extends StatelessWidget {
  final _store = GetStorage();

  @override
  Widget build(BuildContext context) {
    DateTime firstDay;
    DateTime lastDay;
    String content;

    return _store.read(AppStorageKey.studentId) != null ? Scaffold(
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
    ) : Scaffold(
      appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: kPrimaryColor,
          title: Text("Danh sách nghỉ phép")),
      body: GetBuilder<ScheduleController>(
        init: Get.find(),
        builder: (controller) {
          return Container(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: controller.leaveDay.length,
              itemBuilder: (BuildContext context, int index) {
                final item = controller.leaveDay[index];
                return InkWell(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF81E272),
                          blurRadius: 2,
                          spreadRadius: 1,
                        ), //BoxSh
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.studentID.firstName + item.studentID.lastName,
                                  style: TextStyle(
                                      color: Color(0xFF81E272),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  "Số ngày nghỉ:" + " " + item.daysOff.toString(),
                                  style: TextStyle(
                                      color: Color(0xFF81E272)),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  "Lý do:" + " " + item.content,
                                  style: TextStyle(
                                      color: Color(0xFF81E272)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),

      bottomNavigationBar: NavigationView(),
      // Column(
      //   children: [
      //     Container(
      //       width: Get.width,
      //       height: 75,
      //       child: Stack(
      //         children: [
      //           Container(
      //             width: Get.width,
      //             height: 50,
      //             decoration: BoxDecoration(
      //                 color: kPrimaryColor,
      //                 borderRadius: BorderRadius.only(
      //                   bottomLeft: Radius.circular(20),
      //                   bottomRight: Radius.circular(20),
      //                 )),
      //           ),
      //           Positioned(
      //             bottom: 0,
      //             left: 0,
      //             right: 0,
      //             child: Container(
      //               margin: const EdgeInsets.symmetric(
      //                   horizontal: kDefaultPadding * 2),
      //               padding: const EdgeInsets.symmetric(
      //                   horizontal: kDefaultPadding * 1.5),
      //               width: Get.width,
      //               height: 50,
      //               decoration: BoxDecoration(
      //                   color: Colors.white,
      //                   borderRadius: BorderRadius.circular(50),
      //                   boxShadow: [
      //                     BoxShadow(
      //                         offset: Offset(0, 10),
      //                         blurRadius: 50,
      //                         color: kPrimaryColor.withOpacity(0.23))
      //                   ]),
      //               child: Row(
      //                 children: [
      //                   Expanded(
      //                     child: TextField(
      //                       decoration: InputDecoration(
      //                           enabledBorder: InputBorder.none,
      //                           focusedBorder: InputBorder.none,
      //                           hintText: "Search",
      //                           hintStyle: TextStyle(
      //                             color: kPrimaryColor,
      //                           )),
      //                     ),
      //                   ),
      //                   GestureDetector(
      //                     child: Icon(
      //                       Icons.search_rounded,
      //                       color: kPrimaryColor,
      //                       size: 25,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //     SizedBox(height: 10),
      //     Expanded(
      //       child: ListView.builder(
      //         itemCount: 20,
      //         itemBuilder: (context, index) {
      //           return Container(
      //             padding: const EdgeInsets.symmetric(horizontal: 20),
      //             margin: const EdgeInsets.only(
      //                 top: kDefaultPadding * 2,
      //                 left: kDefaultPadding * 2,
      //                 right: kDefaultPadding * 2),
      //             width: Get.width,
      //             height: 80,
      //             decoration: BoxDecoration(
      //                 color: Colors.white,
      //                 borderRadius: BorderRadius.circular(10),
      //                 boxShadow: [
      //                   BoxShadow(
      //                       offset: Offset(0, 0),
      //                       color: kPrimaryColor.withOpacity(0.3),
      //                       blurRadius: 7),
      //                 ]),
      //             child: Row(
      //               children: [
      //                 CircleAvatar(
      //                   radius: 25,
      //                   backgroundColor: kPrimaryColor,
      //                   child: Image.asset("assets/images/user_2.png"),
      //                 ),
      //                 SizedBox(width: 10),
      //                 Expanded(
      //                   child: Text(
      //                     "Nguyễn Duy Nhân",
      //                     style: TextStyle(color: kPrimaryColor, fontSize: 18),
      //                   ),
      //                 ),
      //                 GestureDetector(
      //                   child: Icon(
      //                     Icons.arrow_right,
      //                     size: 30,
      //                     color: kPrimaryColor,
      //                   ),
      //                   onTap: (){
      //                     Get.toNamed(Routes.DETAIL_HEALTH_STUDENT);
      //                   },
      //                 )
      //               ],
      //             ),
      //           );
      //         },
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
