import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {

    Timer(Duration(seconds: 1), () {

      Navigator.pushNamed(context, '/homeScreen');

    });

    super.initState();
  }

  _showImage(){

    return Container(
      height: 896.h,
      width: 414.w,
      child: Image.asset('asset/image_asset/splash.png', fit: BoxFit.fill,),
    );

  }

  @override
  Widget build(BuildContext context) {

    return _showImage();

  }
}
