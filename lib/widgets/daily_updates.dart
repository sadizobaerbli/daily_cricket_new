import '../../config/color_constants.dart';
import '../../config/strings.dart';
import '../../config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DailyUpdates extends StatelessWidget {
  final double initialPaddingLeft;
  const DailyUpdates({
    Key? key,
    this.initialPaddingLeft = 0,
  }) : super(key: key);

  ///This section refers the card
  Container _card() {
    return Container(
      width: 336.w,
      margin: EdgeInsets.only(top: 11.w),
      padding: EdgeInsets.fromLTRB(8.w, 8.h, 15.w, 10.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Grey.withOpacity(0.4),
            spreadRadius: .1,
            blurRadius: 5,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r),
          topRight: Radius.circular(15.r),
        ),
        color: BasicWhite,
      ),
      child: Row(
        children: [
          Container(
            height: 101.h,
            width: 128.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                'asset/image_asset/pic.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: 9.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titleText,
                  maxLines: 1,
                  style: boldText(fontSize: 13.sp),
                ),
                SizedBox(height: 7.w),
                Text(
                  longText,
                  maxLines: 3,
                  style: semiBoldText(
                    fontSize: 12.sp,
                    color: Grey,
                    lineHeight: 16.sp / 12.sp,
                  ),
                ),
                SizedBox(
                  height: 6.w,
                ),
                Row(
                  children: [
                    Text(
                      '1.3M Views',
                      maxLines: 1,
                      style: semiBoldText(
                        fontSize: 9.sp,
                        color: Grey,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5.w, right: 4.sp),
                      height: 2.h,
                      width: 2.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Grey,
                      ),
                    ),
                    Text(
                      '3 months ago',
                      maxLines: 1,
                      style: semiBoldText(
                        fontSize: 9.sp,
                        color: Grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336.w,
      margin: EdgeInsets.only(left: initialPaddingLeft),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _card(),
          Container(
            width: 336.w,
            height: 44.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15.r),
                bottomLeft: Radius.circular(15.r),
              ),
              color: PrimaryRed,
            ),
            child: Center(
              child: Text(
                'Latest News',
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  fontSize: 15.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
