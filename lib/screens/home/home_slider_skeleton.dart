import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:dailycricket_nv/config/skeleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSliderSkeleton extends StatelessWidget {
  const HomeSliderSkeleton({Key? key}) : super(key: key);

  _sliderSkeleton(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(left: 22.w,),
      height: 200.h,
      child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 333.w,
              margin: EdgeInsets.only(right: 15.w, bottom: 20.h, left: 12.w),
              decoration: BoxDecoration(
                color: BasicWhite,
                boxShadow: [
                  BoxShadow(
                    color: Grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 8,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(9.w, 23.h, 9.w, 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 8.w,),
                        RoundedSkeleton(height: 16, width: 140,),
                        Spacer(),
                        RoundedSkeleton(height: 16, width: 80,),
                        SizedBox(width: 8.w,),
                      ],
                    ),
                    SizedBox(height: 21.h,),
                    Row(
                      children: [
                        SizedBox(width: 8.w,),
                        RoundedSkeleton(height: 16, width: 80,),
                        Spacer(),
                        RoundedSkeleton(height: 16, width: 80,),
                        SizedBox(width: 7.w,),
                      ],
                    ),

                    SizedBox(height: 21.h,),
                    Row(
                      children: [
                        SizedBox(width: 8.w,),
                        RoundedSkeleton(height: 16, width: 240,),
                      ],
                    ),
                    SizedBox(height: 21.h,),
                    Row(
                      children: [
                        SizedBox(width: 8.h,),
                        RoundedSkeleton(height: 16, width: 140,),
                        SizedBox(width: 16.h,),
                        RoundedSkeleton(height: 16, width: 140,),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _sliderSkeleton(context);
  }
}
