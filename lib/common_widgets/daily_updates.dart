import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:dailycricket_nv/config/strings.dart';
import 'package:dailycricket_nv/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DailyUpdates extends StatefulWidget {
  const DailyUpdates({Key? key}) : super(key: key);

  @override
  _DailyUpdatesState createState() => _DailyUpdatesState();
}

class _DailyUpdatesState extends State<DailyUpdates> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336.w,
      margin: EdgeInsets.only(right: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 117.h, width: 336.w,
            padding: EdgeInsets.fromLTRB(6.w, 6.h, 15.w, 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              ),
              color: BasicWhite,
            ),
            child: Row(
              children: [

                Container(
                  height: 101.h, width: 128.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset('asset/image_asset/pic.jpg',
                      fit: BoxFit.fill,),
                  ),
                ),
                SizedBox(width: 9.w,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(titleText,
                        maxLines: 1,
                        style: boldText(fontSize: 13.sp),),
                      SizedBox(height: 7.w,),
                      Text(longText,
                        maxLines: 3,
                        style: semiBoldText(
                            fontSize: 12.sp, color: Grey,
                            lineHeight: 16.sp/12.sp),
                      ),
                      SizedBox(height: 6.w,),
                      Row(
                        children: [
                          Text('1.3M Views',
                            maxLines: 1,
                            style: semiBoldText(fontSize: 9.sp,
                                color: Grey),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5.w, right: 4.sp),
                            height: 2.h, width: 2.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Grey,
                            ),
                          ),
                          Text('3 months ago',
                            maxLines: 1,
                            style: semiBoldText(fontSize: 9.sp,
                                color: Grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),


              ],
            ),
          ),
          Container(
            height: 46.h, width: 334.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15.r),
                bottomLeft: Radius.circular(15.r),),
              color: PrimaryRed,
            ),
            child: Center(
              child: Text('Latest News',
                maxLines: 1,
                style: TextStyle(fontWeight: FontWeight.w800,
                    color: Colors.white, fontSize: 15.sp),),
            ),
          )

        ],
      ),
    );
  }
}
