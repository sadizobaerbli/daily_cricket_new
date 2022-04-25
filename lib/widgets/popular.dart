import '../../config/color_constants.dart';
import '../../config/strings.dart';
import '../../config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Popular extends StatelessWidget {
  const Popular({Key? key}) : super(key: key);

  ///This section refers the image
  Container _image() {
    return Container(
      height: 251.h,
      width: double.infinity,
      margin: EdgeInsets.only(right: 15.w, left: 15.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Grey.withOpacity(0.4),
            spreadRadius: .1,
            blurRadius: 5,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Image.asset(
          'asset/image_asset/pic_1.jpg',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  ///This section refers the card info's
  Column _cardInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 250.w,
          child: Text(
            titleText,
            maxLines: 1,
            style: boldText(
              fontSize: 15.sp,
              color: BasicWhite,
              lineHeight: 20.sp / 15.sp,
            ),
          ),
        ),
        Container(
          color: Grey.withOpacity(.2),
          child: Row(
            children: [
              Text(
                '1.3M Views',
                maxLines: 1,
                style: regularText(
                  fontSize: 9.sp,
                  color: BasicWhite,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 5.w,
                  right: 4.sp,
                ),
                height: 2.h,
                width: 2.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: BasicWhite,
                ),
              ),
              Text(
                '3 months ago',
                maxLines: 1,
                style: regularText(
                  fontSize: 9.sp,
                  color: BasicWhite,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _image(),
        Positioned(
          left: 18.w,
          bottom: 13.h,
          child: _cardInfo(),
        ),
      ],
    );
  }
}
