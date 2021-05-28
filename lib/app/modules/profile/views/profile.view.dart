import 'package:doan/app/modules/navigation/views/navigation.view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doan/app/modules/profile/widgets/body.dart';
import 'package:doan/app/theme/color_theme.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: kPrimaryColor,
        title: Text("Tài Khoản", style: TextStyle(
          color: Colors.white,
        ),),
      ),
      body: Body(),
      bottomNavigationBar: NavigationView(),
    );
  }
}

