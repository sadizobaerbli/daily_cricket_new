import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:dailycricket_nv/config/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(height: 896.h, width: 414.w,),
          Positioned(
            bottom: 0.h,
            child: Container(
              height: 60.h, width: 414.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r),
                ),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    PrimaryDeepGreen,
                    PrimaryGreen,
                  ]
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home, color: BasicWhite, size: 26.sp,),
                      SizedBox(height: 5.h,),
                      Text('Home'.toUpperCase(),
                        style: regularText(
                            fontSize: 9.sp,
                            color: BasicWhite,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.article_outlined, color: BasicWhite, size: 26.sp,),
                      SizedBox(height: 5.h,),
                      Text('Article'.toUpperCase(),
                        style: regularText(
                            fontSize: 9.sp,
                            color: BasicWhite,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.wine_bar_outlined, color: BasicWhite, size: 26.sp,),
                      SizedBox(height: 5.h,),
                      Text('series'.toUpperCase(),
                        style: regularText(
                            fontSize: 9.sp,
                            color: BasicWhite,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.schedule_send, color: BasicWhite, size: 26.sp,),
                      SizedBox(height: 5.h,),
                      Text('fixture'.toUpperCase(),
                        style: regularText(
                            fontSize: 9.sp,
                            color: BasicWhite,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_forward_sharp, color: BasicWhite, size: 26.sp,),
                      SizedBox(height: 5.h,),
                      Text('more'.toUpperCase(),
                        style: regularText(
                            fontSize: 9.sp,
                            color: BasicWhite,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
