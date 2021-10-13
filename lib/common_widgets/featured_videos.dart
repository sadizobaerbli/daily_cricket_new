import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:dailycricket_nv/config/strings.dart';
import 'package:dailycricket_nv/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class FeaturedVideos extends StatefulWidget {
  const FeaturedVideos({Key? key}) : super(key: key);

  @override
  _FeaturedVideosState createState() => _FeaturedVideosState();
}

class _FeaturedVideosState extends State<FeaturedVideos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 234.w,
      margin: EdgeInsets.only(right: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 134.h, width: 234.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.asset('asset/image_asset/picture.png',
                fit: BoxFit.fill,),
            ),
          ),
          SizedBox(height: 7.h,),

          Container(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(longText,
              maxLines: 3,
              style: semiBoldText(fontSize: 12.sp, lineHeight: 16.sp/12.sp),
            ),
          ),
          SizedBox(height: 7.h,),

          Container(
            padding: EdgeInsets.only(left: 8.w),
            child: Text('3 months ago',
              maxLines: 1,
              style: regularText(fontSize: 8.sp, color: Grey),
            ),
          ),
        ],
      ),
    );
  }
}
