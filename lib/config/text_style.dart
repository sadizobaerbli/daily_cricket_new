
import 'package:flutter/cupertino.dart';
import 'color_constants.dart';

TextStyle boldText({required double fontSize, Color color = BasicBlack, double lineHeight = 1.0}){

  return TextStyle(
    fontSize: fontSize,
    fontFamily: 'SegoeUi',
    fontWeight: FontWeight.bold,
    color: color,
    height: lineHeight,
  );
}


TextStyle mediumText({required double fontSize, Color color = BasicBlack, double lineHeight = 1.0}){

  return TextStyle(
    fontSize: fontSize,
    fontFamily: 'SegoeUi',
    fontWeight: FontWeight.w500,
    color: color,
    height: lineHeight,
  );
}

TextStyle semiBoldText({required double fontSize, Color color = BasicBlack, double lineHeight = 1.0}){

  return TextStyle(
    fontSize: fontSize,
    fontFamily: 'SegoeUi',
    fontWeight: FontWeight.w600,
    color: color,
    height: lineHeight,
  );
}

TextStyle regularText({required double fontSize, Color color = BasicBlack, double lineHeight = 1.0}){

  return TextStyle(
    fontSize: fontSize,
    fontFamily: 'SegoeUi',
    fontWeight: FontWeight.normal,
    color: color,
    height: lineHeight,
  );
}