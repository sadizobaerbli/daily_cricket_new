import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:dailycricket_nv/config/strings.dart';
import 'package:dailycricket_nv/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class EditorsPick extends StatefulWidget {
  const EditorsPick({Key? key}) : super(key: key);

  @override
  _EditorsPickState createState() => _EditorsPickState();
}

class _EditorsPickState extends State<EditorsPick> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 251.w,
      margin: EdgeInsets.only(right: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 124.h, width: 250.w,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),),
              child: Image.asset('asset/image_asset/pic_2.jpg',
                fit: BoxFit.fill,),
            ),
          ),
          Container(
            height: 44.h, width: 250.w,
            padding: EdgeInsets.fromLTRB(21.w, 4.h, 15.w, 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15.r),
                bottomLeft: Radius.circular(15.r),
              ),
              color: BasicWhite,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titleText,
                  maxLines: 1,
                  style: boldText(fontSize: 11.sp, lineHeight: 15.sp/11.sp),
                ),
                SizedBox(height: 2.sp,),
                Text('3 months ago',
                  maxLines: 1,
                  style: semiBoldText(fontSize: 6.sp, color: Grey),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
