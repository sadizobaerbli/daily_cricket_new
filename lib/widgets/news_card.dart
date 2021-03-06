import '../../config/color_constants.dart';
import '../../config/strings.dart';
import '../../config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key}) : super(key: key);

  ///This section refers the information on card
  Column _cardInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          titleText,
          maxLines: 1,
          style: boldText(fontSize: 15.sp),
        ),
        SizedBox(height: 6.h),
        Text(
          longText,
          maxLines: 3,
          style: semiBoldText(
            fontSize: 12.sp,
            lineHeight: 16.sp / 12.sp,
          ),
        ),
        SizedBox(height: 5.w),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 384.w,
      child: Container(
        height: 124.h,
        width: 384.w,
        margin: EdgeInsets.only(bottom: 13.sp),
        padding: EdgeInsets.fromLTRB(10.w, 8.h, 12.w, 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.r),
          boxShadow: [
            BoxShadow(
              color: Grey.withOpacity(0.4),
              spreadRadius: .1,
              blurRadius: 5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          color: BasicWhite,
        ),
        child: Row(
          children: [
            Container(
              height: 111.h,
              width: 129.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.asset(
                  'asset/image_asset/picture_2.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: 14.w,
            ),
            Expanded(
              child: _cardInfo(),
            ),
          ],
        ),
      ),
    );
  }
}
