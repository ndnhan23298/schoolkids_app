import 'package:doan/app/modules/chat/controllers/chat.controller.dart';
import 'package:doan/app/routes/app_pages.dart';
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
          title: Text("Hoc Phi")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: HorizontalDataTable(
              leftHandSideColumnWidth: 150,
              rightHandSideColumnWidth: 200,
              isFixedHeader: true,
              headerWidgets: [
                Container(
                  child: Text("Thang",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  width: 150,
                  height: 56,
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                ),
                Container(
                  child: Text("Student",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  width: 100,
                  height: 56,
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                ),
                Container(
                  child: Text("Trang Thai",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  width: 100,
                  height: 56,
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                ),
              ],
              leftSideItemBuilder: _generateFirstColumnRow,
              rightSideItemBuilder: _generateRightHandSideColumnRow,
              itemCount: 12,
              rowSeparatorWidget: const Divider(
                color: Colors.black54,
                height: 1.0,
                thickness: 0.0,
              ),
              //leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
              //rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
              // verticalScrollbarStyle: const ScrollbarStyle(
              //   isAlwaysShown: true,
              //   thickness: 4.0,
              //   radius: Radius.circular(5.0),
              // ),
              // horizontalScrollbarStyle: const ScrollbarStyle(
              //   isAlwaysShown: true,
              //   thickness: 4.0,
              //   radius: Radius.circular(5.0),
              // ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: HorizontalDataTable(
              leftHandSideColumnWidth: 150,
              rightHandSideColumnWidth: 300,
              isFixedHeader: true,
              headerWidgets: [
                Container(
                  child: Text("Thang",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  width: 150,
                  height: 56,
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                ),
                Container(
                  child: Text("Student",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  width: 150,
                  height: 56,
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                ),
                Container(
                  child: Text("Trang Thai",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  width: 150,
                  height: 56,
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                ),
              ],
              leftSideItemBuilder: _generateFirstColumnRow,
              rightSideItemBuilder: _generateRightHandSideColumnRow,
              itemCount: 12,
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
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    final thang = index + 1;
    return Column(
      children: [
        Container(
          child: Text("Thang $thang"),
          width: 150,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Divider(
          thickness: 1,
          height: 1,
          color: Colors.grey,
        )
      ],
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Container(
              child: Text("abc"),
              width: 100,
              height: 52,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
            Container(
              child: Text("status"),
              width: 100,
              height: 52,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
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
  }
}
