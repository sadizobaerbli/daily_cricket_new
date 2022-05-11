import '../../config/color_constants.dart';
import '../../config/strings.dart';
import '../../config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Trending extends StatelessWidget {
  const Trending({Key? key}) : super(key: key);

  ///This Indicates the information section of every card
  Column _cardInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120.w,
          child: Text(
            titleText,
            maxLines: 2,
            style: boldText(
              fontSize: 15.sp,
              color: BasicWhite,
              lineHeight: 20.sp / 15.sp,
            ),
          ),
        ),
        Container(
          color: Grey.withOpacity(.2),
          child: Text(
            '3 months ago',
            maxLines: 1,
            style: regularText(
              fontSize: 11.sp,
              color: BasicWhite,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 187.h,
          width: 187.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              'asset/image_asset/pic_1.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          left: 15.w,
          bottom: 13.h,
          child: _cardInfo(),
        ),
      ],
    );
  }
}
