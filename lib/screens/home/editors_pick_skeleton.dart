import 'package:dailycricket_nv/config/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditorsPickSkeleton extends StatelessWidget {
  const EditorsPickSkeleton({Key? key}) : super(key: key);

  _skeleton(){
    return SizedBox(
      height: 200.h,
      child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return Container(
              width: 251.w,
              margin: EdgeInsets.only(left: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RoundedSkeleton(height: 124, width: 250,),
                  SizedBox(height: 6.h,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RoundedSkeleton(height: 14, width: 230,),
                      SizedBox(height: 4.h,),
                      RoundedSkeleton(height: 12, width: 120,),
                    ],
                  )

                ],
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _skeleton();
  }
}
