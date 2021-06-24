import 'package:doan/app/modules/navigation/controllers/navigation.controller.dart';
import 'package:doan/app/routes/app_pages.dart';
import 'package:doan/app/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      init: Get.find(),
      builder: (controller){
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: NavigationController.currentIndex.value,
          backgroundColor: Colors.white,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kPrimaryColor.withOpacity(0.4),
          unselectedLabelStyle: TextStyle(color: Colors.red),
          selectedIconTheme: IconThemeData(color: kPrimaryColor),
          onTap: (value){
            controller.selectedIndex(value);
            if(NavigationController.currentIndex.value == 0){
              Get.toNamed(Routes.HOME);
            }
            if(NavigationController.currentIndex.value == 1){
              Get.toNamed(Routes.FEATURE);
            }
            if(NavigationController.currentIndex.value == 2){
              Get.toNamed(Routes.PROFILE);
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Trang chủ",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: "Tính năng",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Thông tin",
            ),
          ],
        );
      },
    );
  }
}
