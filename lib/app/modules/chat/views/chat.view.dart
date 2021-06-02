import 'package:doan/app/modules/chat/widgets/body.dart';
import 'package:doan/app/routes/app_pages.dart';
import 'package:doan/app/theme/color_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatView extends StatelessWidget {
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
          onTap: (){
            Get.back();
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Covid19 EagleMvt',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Active 3m ago',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.local_phone),
            onPressed: () {
              Get.toNamed(Routes.HEALTH_MANAGEMENT);
            },
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
              Get.toNamed(Routes.EXTRACURRICULAR_ACTIVITY);
            },
          ),
          SizedBox(width: 10)
        ],
      ),
      body: Body(),
    );
  }
}

