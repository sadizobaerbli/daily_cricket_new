import 'dart:async';
import 'package:dailycricket_nv/config/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () {
        Timer(Duration(seconds: 1), () {
          Navigator.pushNamed(context, '/homeScreen');
        });
      },
      child: Container(
        height: 896.h,
        width: 414.w,
        child: Image.asset(
          'asset/image_asset/splash.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
