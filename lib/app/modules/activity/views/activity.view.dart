import 'package:doan/app/modules/activity/controllers/activity.controller.dart';
import 'package:doan/app/modules/activity/views/extracurricular_activity.view.dart';
import 'package:doan/app/modules/navigation/views/navigation.view.dart';
import 'package:doan/app/theme/color_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: kPrimaryColor,
        title: Text(
          "Activity",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: GetBuilder<ActivityController>(
          init: Get.find(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ABCDEFGH",
                                  style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "144, Nguyen Luong bang, Hoa Khanh Bac, Lien Chieu, Da Nang",
                                  style: TextStyle(color: Colors.pink),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 110,
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                // border: Border.all(color: Colors.black, width: 1)
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 1,
                                      spreadRadius: 1)
                                ]),
                            child: FlatButton(
                              child: Text(
                                'Tham Gia',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          Get.dialog(
            ExtracurricularActivityView(),
          );
        },
      ),
      bottomNavigationBar: NavigationView(),
    );
  }
}
