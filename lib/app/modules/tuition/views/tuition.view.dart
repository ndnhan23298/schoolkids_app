import 'package:doan/app/modules/tuition/controllers/tuition.controller.dart';
import 'package:doan/app/utils/keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doan/app/theme/color_theme.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class TuitionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: kPrimaryColor,
          title: Text("Học phí")),
      body: GetBuilder<TuitionController>(
          init: Get.find(),
          builder: (controller) {
            return controller.store.read(AppStorageKey.studentId) != null
                ? HorizontalDataTable(
                    leftHandSideColumnWidth: 80,
                    rightHandSideColumnWidth: 350,
                    isFixedHeader: true,
                    headerWidgets: [
                      Container(
                        child: Text("Tháng",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        width: 80,
                        height: 56,
                        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        alignment: Alignment.center,
                      ),
                      Container(
                        child: Text("Học sinh",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        width: 150,
                        height: 56,
                        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        alignment: Alignment.center,
                      ),
                      Container(
                        child: Text("Tình trạng",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        width: 100,
                        height: 56,
                        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        alignment: Alignment.center,
                      ),
                      Container(
                        child: Text("Học phí",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        width: 100,
                        height: 56,
                        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        alignment: Alignment.center,
                      ),
                    ],
                    leftSideItemBuilder: _generateFirstColumnRowStudent,
                    rightSideItemBuilder:
                        _generateRightHandSideColumnRowStudent,
                    itemCount: controller.studentTuition.length,
                    rowSeparatorWidget: const Divider(
                      color: Colors.pink,
                      height: 1.0,
                      thickness: 0.0,
                    ),
                  )
                : HorizontalDataTable(
                    leftHandSideColumnWidth: 80,
                    rightHandSideColumnWidth: 300,
                    isFixedHeader: true,
                    headerWidgets: [
                      Container(
                        child: Text("Tháng",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        width: 80,
                        height: 56,
                        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        alignment: Alignment.center,
                      ),
                      Container(
                        child: Text("Học sinh",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        width: 150,
                        height: 56,
                        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        alignment: Alignment.center,
                      ),
                      Container(
                        child: Text("Tình trạng",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        width: 150,
                        height: 56,
                        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        alignment: Alignment.center,
                      ),
                    ],
                    leftSideItemBuilder: _generateFirstColumnRowClass,
                    rightSideItemBuilder: _generateRightHandSideColumnRowClass,
                    itemCount: controller.classTuition.length,
                    rowSeparatorWidget: const Divider(
                      color: Colors.black54,
                      height: 1.0,
                      thickness: 0.0,
                    ),
                    leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
                    rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
                    verticalScrollbarStyle: const ScrollbarStyle(
                      isAlwaysShown: true,
                      thickness: 4.0,
                      radius: Radius.circular(5.0),
                    ),
                    horizontalScrollbarStyle: const ScrollbarStyle(
                      isAlwaysShown: true,
                      thickness: 4.0,
                      radius: Radius.circular(5.0),
                    ),
                  );
          }),
    );
  }

  Widget _generateFirstColumnRowStudent(BuildContext context, int index) {
    return GetBuilder<TuitionController>(
        init: Get.find(),
        builder: (controller) {
          return Column(
            children: [
              Container(
                child: Text("${controller.studentTuition[index].month}"),
                width: 150,
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.center,
              ),
              Divider(
                thickness: 1,
                height: 1,
                color: Colors.grey,
              )
            ],
          );
        });
  }

  Widget _generateRightHandSideColumnRowStudent(
      BuildContext context, int index) {
    return GetBuilder<TuitionController>(
        init: Get.find(),
        builder: (controller) {
          final name =
              "${controller.studentTuition[index].studentID.firstName} ${controller.studentTuition[index].studentID.lastName}";
          return Column(
            children: [
              Row(
                children: <Widget>[
                  Container(
                    child: Text(name),
                    width: 150,
                    height: 52,
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.center,
                  ),
                  Container(
                    child: Text("${controller.studentTuition[index].status}"),
                    width: 100,
                    height: 52,
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.center,
                  ),
                  Container(
                    child: Text("${controller.studentTuition[index].fee}"),
                    width: 100,
                    height: 52,
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.center,
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                height: 1,
                color: Colors.grey,
              )
            ],
          );
        });
  }

  Widget _generateFirstColumnRowClass(BuildContext context, int index) {
    return GetBuilder<TuitionController>(
        init: Get.find(),
        builder: (controller) {
          return Column(
            children: [
              Container(
                child: Text("${controller.classTuition[index].month}"),
                width: 150,
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.center,
              ),
              Divider(
                thickness: 1,
                height: 1,
                color: Colors.grey,
              )
            ],
          );
        });
  }

  Widget _generateRightHandSideColumnRowClass(BuildContext context, int index) {
    return GetBuilder<TuitionController>(
        init: Get.find(),
        builder: (controller) {
          final name =
              "${controller.classTuition[index].studentID.firstName}  ${controller.classTuition[index].studentID.lastName}";
          return Column(
            children: [
              Row(
                children: <Widget>[
                  Container(
                    child: Text(name),
                    width: 150,
                    height: 52,
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.center,
                  ),
                  Container(
                    child: InkWell(
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                                "${controller.classTuition[index].status}"),
                            width: 110,
                            height: 52,
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            alignment: Alignment.centerLeft,
                          ),
                          Icon(
                            Icons.swap_horiz_outlined,
                            color: Colors.pink,
                          ),
                        ],
                      ),
                      onTap: () {
                        controller.onSave(index);
                      },
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                height: 1,
                color: Colors.grey,
              )
            ],
          );
        });
  }
}
