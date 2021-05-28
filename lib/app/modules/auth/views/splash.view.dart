import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SplashView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/google.jpg',
          fit: BoxFit.contain,
          width: 200.0,
        ),
      ),
    );
  }
}
