import 'package:doan/app/modules/navigation/views/navigation.view.dart';
import 'package:doan/app/routes/app_pages.dart';
import 'package:doan/app/utils/keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doan/app/theme/color_theme.dart';
import 'package:get_storage/get_storage.dart';

class FeaturesView extends StatelessWidget {

  final _store = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 70,
            elevation: 0,
            backgroundColor: kPrimaryColor,
            title: Text("Các chức năng chính")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.ACTIVITY);
                },
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
                      Container(width: 70, height: 70,child: Image.asset('assets/images/activity.png'),),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Hoạt động ngoại khoá",
                          style: TextStyle(color: kPrimaryColor, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.SCHEDULE);
                },
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
                      Container(width: 70, height: 70,child: Image.asset('assets/images/calendar.png'),),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Báo nghỉ",
                          style: TextStyle(color: kPrimaryColor, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.TUITION);
                },
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
                      Container(width: 70, height: 70,child: Image.asset('assets/images/fee.png'),),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Học phí",
                          style: TextStyle(color: kPrimaryColor, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.LIST_USER);
                },
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
                      Container(width: 70, height: 70,child: Image.asset('assets/images/message.png'),),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Tin nhắn",
                          style: TextStyle(color: kPrimaryColor, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  if(_store.read(AppStorageKey.studentId) != null){
                    Get.toNamed(Routes.DETAIL_HEALTH_STUDENT);
                  }else{
                    Get.toNamed(Routes.HEALTH_MANAGEMENT);
                  }
                },
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
                      Container(width: 70, height: 70,child: Image.asset('assets/images/health.png'),),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Thông tin sức khoẻ",
                          style: TextStyle(color: kPrimaryColor, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
