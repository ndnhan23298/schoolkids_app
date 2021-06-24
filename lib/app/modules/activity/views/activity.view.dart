import 'package:doan/app/modules/activity/controllers/activity.controller.dart';
import 'package:doan/app/modules/activity/views/extracurricular_activity.view.dart';
import 'package:doan/app/modules/navigation/views/navigation.view.dart';
import 'package:doan/app/routes/app_pages.dart';
import 'package:doan/app/theme/color_theme.dart';
import 'package:doan/app/utils/keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ActivityView extends StatelessWidget {
  final _store = GetStorage();

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
          "Hoạt động ngoại khoá",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: GetBuilder<ActivityController>(
          init: Get.find(),
          builder: (controller) {
            return _store.read(AppStorageKey.studentId) != null
                ? DefaultTabController(
                    length: 2,
                    child: Scaffold(
                      appBar: TabBar(
                        tabs: [
                          Tab(
                            child: Text(
                              'Hoạt động',
                              style: TextStyle(color: Color(0xFF81E272)),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Đã đăng ký',
                              style: TextStyle(color: Color(0xFF81E272)),
                            ),
                          ),
                        ],
                      ),
                      body: TabBarView(
                        children: [
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: controller.isLoadding.value
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : ListView.builder(
                                      padding: const EdgeInsets.all(8),
                                      itemCount: controller.activitiess.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final item =
                                            controller.activitiess[index];
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                          width: double.infinity,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        item.name,
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF81E272),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        item.address,
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF81E272)),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.onJoin(controller
                                                        .activitiess[index].id);
                                                  },
                                                  child: Container(
                                                    width: 110,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        // border: Border.all(color: Colors.black, width: 1)
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Color(
                                                                  0xFF81E272),
                                                              blurRadius: 1,
                                                              spreadRadius: 1)
                                                        ]),
                                                    child: FlatButton(
                                                      child: Text(
                                                        'Tham Gia',
                                                        style: TextStyle(
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: controller.isLoadding.value
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : ListView.builder(
                                      padding: const EdgeInsets.all(8),
                                      itemCount:
                                          controller.joinedActivitiess.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final item =
                                            controller.joinedActivitiess[index];
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                          width: double.infinity,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        item.name,
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF81E272),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        item.address,
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF81E272),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ))
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: controller.isLoadding.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: controller.activitiess.length,
                            itemBuilder: (BuildContext context, int index) {
                              final item = controller.activitiess[index];
                              return InkWell(
                                onTap: (){
                                  Get.toNamed(Routes.PARTICIPANT, arguments: item.id);
                                  controller.getParticipant();
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  width: double.infinity,
                                  height: 80,
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
                                                item.name,
                                                style: TextStyle(
                                                    color: Color(0xFF81E272),
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              Text(
                                                item.address,
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
          }),
      floatingActionButton: _store.read(AppStorageKey.studentId) == null
          ? FloatingActionButton(
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
            )
          : SizedBox(),
      bottomNavigationBar: NavigationView(),
    );
  }
}
