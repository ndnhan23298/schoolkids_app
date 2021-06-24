import 'package:doan/app/modules/auth/controllers/auth.controller.dart';
import 'package:doan/app/routes/app_pages.dart';
import 'package:doan/app/utils/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:doan/app/theme/color_theme.dart';
import 'package:get_storage/get_storage.dart';

class Body extends StatelessWidget {
  final _store = GetStorage();

  Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildInformation(),
          Divider(
            thickness: 1,
            color: kPrimaryColor.withOpacity(0.5),
            indent: 20,
            endIndent: 20,
          ),
          _buildFunction(),
        ],
      ),
    );
  }

  Widget _buildFunction() {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding, horizontal: kDefaultPadding * 2.5),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: kDefaultPadding * 1.5),
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 0.5, horizontal: kDefaultPadding),
                width: Get.width,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 3,
                          color: kPrimaryColor),
                    ]),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: Get.height,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 15),
                    Expanded(child: Text("Hồ sơ của bé", style: TextStyle(
                        color: Colors.black,
                        fontSize: 18
                    ),))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: kDefaultPadding * 1.5),
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 0.5, horizontal: kDefaultPadding),
                width: Get.width,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 3,
                          color: kPrimaryColor),
                    ]),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: Get.height,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 15),
                    Expanded(child: Text("Thông tin tài khoản", style: TextStyle(
                        color: Colors.black,
                        fontSize: 18
                    ),))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: kDefaultPadding * 1.5),
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 0.5, horizontal: kDefaultPadding),
                width: Get.width,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 3,
                          color: kPrimaryColor),
                    ]),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: Get.height,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 15),
                    Expanded(child: Text("Hướng dẫn sử dụng", style: TextStyle(
                        color: Colors.black,
                        fontSize: 18
                    ),))
                  ],
                ),
              ),
              GestureDetector(
                onTap:  () async {
                  Get.toNamed(Routes.USER_ACCESS);
                  await _store.remove(AppStorageKey.classId);
                  await _store.remove(AppStorageKey.studentId);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: kDefaultPadding * 1.5),
                  padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 0.5, horizontal: kDefaultPadding),
                  width: Get.width,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 3,
                            color: kPrimaryColor),
                      ]),
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: Get.height,
                        child:
                        Image.asset('assets/images/swap_icon.png'),
                      ),
                      SizedBox(width: 15),
                      Expanded(child: Text("Đổi tài khoản", style: TextStyle(
                          color: Colors.black,
                          fontSize: 18
                      ),))
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  AuthController.to.logout();
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: kDefaultPadding * 1.5),
                  padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 0.5, horizontal: kDefaultPadding),
                  width: Get.width,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 3,
                            color: kPrimaryColor),
                      ]),
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: Get.height,
                        child:
                        Image.asset('assets/images/logout_icon.png'),
                      ),
                      SizedBox(width: 15),
                      Expanded(child: Text("Logout", style: TextStyle(
                          color: Colors.black,
                          fontSize: 18
                      ),))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInformation() {
    return Container(
      width: Get.width,
      height: 290,
      child: Column(
        children: [
          Container(
            width: Get.width,
            height: 220,
            child: Stack(
              children: [
                Container(
                  width: Get.width,
                  height: 160,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/Video Place Here.png"),
                          fit: BoxFit.cover),
                      // color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                ),
                Positioned(
                  bottom: 0,
                  left: Get.width / 2 - 70,
                  child: Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/user_2.png")),
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 0.5,
                                      color:
                                      Colors.black.withOpacity(0.7))
                                ]),
                            child: Icon(
                              Icons.edit_outlined,
                              size: 15,
                              color: kPrimaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mẹ bé Bờm",
                    style: TextStyle(color: kPrimaryColor, fontSize: 18),
                  ),
                  Text(
                    "Tài khoản: mebebom",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
