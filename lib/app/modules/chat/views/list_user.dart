import 'package:doan/app/modules/chat/controllers/chat.controller.dart';
import 'package:doan/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doan/app/theme/color_theme.dart';

class ListUserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: kPrimaryColor,
          title: Text("Các chức năng chính")),
      body: GetBuilder<ChatController>(
          init: Get.find(),
          builder: (controller) {
            return controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: controller.users.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = controller.users[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.CHAT, arguments: item.id);
                          controller.getListMessage(item);
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
                              Container(
                                width: 70,
                                height: 70,
                                child:
                                    Image.asset('assets/images/calendar.png'),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  item.userName,
                                  style: TextStyle(
                                      color: kPrimaryColor, fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          }
          ),
    );
  }
}
