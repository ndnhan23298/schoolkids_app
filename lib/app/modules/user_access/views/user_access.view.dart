import 'package:doan/app/modules/auth/controllers/login.controller.dart';
import 'package:doan/app/modules/user_access/controllers/user_access.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:doan/app/theme/color_theme.dart';

class UserAccessView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserAccessController>(
          init: Get.find(),
          builder: (controller) {
            return Container(
              width: Get.width,
              height: Get.height,
              alignment: Alignment.center,
              color: Color(0xFF81E272),
              child: controller.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : controller.userAccess != null
                      ? ListView.builder(
                          itemCount: controller.data.length,
                          itemBuilder: (context, index) {
                           final item = controller.data[index];
                            return Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
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
                              child: InkWell(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 70,
                                      child: Image.asset('assets/images/fee.png'),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        item.name,
                                        style: TextStyle(
                                            color: kPrimaryColor, fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: (){
                                  controller.onSelected(item);
                                },
                              ),
                            );
                          })
                      : SizedBox(),
            );
          }),
    );
  }
}
