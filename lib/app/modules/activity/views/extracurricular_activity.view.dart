import 'package:doan/app/modules/activity/widgets/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doan/app/theme/color_theme.dart';

class ExtracurricularActivityView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            size: 25,
          ),
          onTap: (){
            Get.back();
          },
        ),
        title: Text("Hoạt động ngoại khóa", style: TextStyle(
          color: Colors.white,
        ),),
      ),
      body: Body(),
    );
  }
}

