import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doan/app/modules/health_management/widgets/body.dart';
import 'package:doan/app/theme/color_theme.dart';

class HealthManagementView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          centerTitle: true,
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Text("Quản lý sức khỏe trẻ")
      ),
      body: Body(),
    );
  }
}

