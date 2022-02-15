import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeSliderSkeleton extends StatelessWidget {
  const HomeSliderSkeleton({Key? key}) : super(key: key);

  _sliderSkeleton(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(left: 34.w),
      child: SizedBox(
        height: 200.h,
        child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 333.w,
                margin: EdgeInsets.only(
                  right: 15.w,
                  bottom: 20.h,
                ),
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
                  padding: EdgeInsets.fromLTRB(9.w, 13.h, 9.w, 12.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 8.w,
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 16.h,
                              width: 140.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: BasicWhite,
                              ),
                            ),
                          ),
                          Spacer(),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 16.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: BasicWhite,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              padding: EdgeInsets.only(left: 2.w),
                              height: 29.h,
                              width: 29.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: BasicWhite,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 16.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: BasicWhite,
                              ),
                            ),
                          ),
                          Spacer(),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 16.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: BasicWhite,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 21.w,
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 16.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: BasicWhite,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              padding: EdgeInsets.only(left: 2.w),
                              height: 29.h,
                              width: 29.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: BasicWhite,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 16.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: BasicWhite,
                              ),
                            ),
                          ),
                          Spacer(),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 16.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: BasicWhite,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 21.w,
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 16.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: BasicWhite,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5.w,
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 16.h,
                              width: 240.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: BasicWhite,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 16.h,
                              width: 140.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: BasicWhite,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 6.h,
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 16.h,
                              width: 140.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: BasicWhite,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _sliderSkeleton(context);
  }
}
