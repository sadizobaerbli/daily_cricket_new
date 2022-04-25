import 'package:dailycricket_nv/config/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedVideosSkeleton extends StatelessWidget {
  const FeaturedVideosSkeleton({Key? key}) : super(key: key);

  _skeleton(){
    return SizedBox(
      height: 200.h,
      child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return Container(
              width: 234.w,
              margin: EdgeInsets.only(left: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RoundedSkeleton(height: 134, width: 234),
                  SizedBox(height: 7.h,),
                  RoundedSkeleton(height: 14, width: 230),
                  SizedBox(height: 2.h,),
                  RoundedSkeleton(height: 14, width: 230),
                  SizedBox(height: 7.h,),
                  RoundedSkeleton(height: 12, width: 120),
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
