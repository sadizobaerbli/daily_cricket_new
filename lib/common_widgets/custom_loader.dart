import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoader extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CustomLoader> with TickerProviderStateMixin {
  AnimationController? animationController;
  
  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: new Duration(seconds: 2), vsync: this);
    animationController!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: animationController!
            .drive(ColorTween(begin: PrimaryGreen, end: PrimaryRed),),
      ),
    );
  }
}