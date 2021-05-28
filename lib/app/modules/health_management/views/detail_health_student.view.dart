import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doan/app/modules/health_management/widgets/add_detail_health_student.dart';
import 'package:doan/app/modules/health_management/widgets/body_detail_health_student.dart';
import 'package:doan/app/theme/color_theme.dart';

class DetailHealthStudentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
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
          title: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: Image.asset("assets/images/user_2.png"),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nguyễn Duy Nhân'),
                  SizedBox(height: 5),
                  Text(
                    '16T3',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ],
          )),
      body: BodyDetailHealthStudent(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          Get.dialog(
            AddDetailHealth(),
          );
        },
      ),
    );
  }
}

