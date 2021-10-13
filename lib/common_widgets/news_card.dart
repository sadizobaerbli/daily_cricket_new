import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:dailycricket_nv/config/strings.dart';
import 'package:dailycricket_nv/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class NewsCard extends StatefulWidget {
  const NewsCard({Key? key}) : super(key: key);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 384.w,
      child: Container(
        height: 124.h, width: 384.w,
        margin: EdgeInsets.only(right: 15.sp, bottom: 13.sp),
        padding: EdgeInsets.fromLTRB(10.w, 8.h, 12.w, 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.r),
          color: BasicWhite,
        ),
        child: Row(
          children: [
            Container(
              height: 111.h, width: 141.w,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.asset('asset/image_asset/picture_2.png',
                    fit: BoxFit.fill,)),
            ),
            SizedBox(width: 14.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(titleText,
                    maxLines: 1,
                    style: boldText(fontSize: 15.sp),
                  ),
                  SizedBox(height: 6.h,),
                  Text(longText,
                    maxLines: 3,
                    style: semiBoldText(
                      fontSize: 12.sp,
                      lineHeight: 16.sp/12.sp,
                    ),
                  ),
                  SizedBox(height: 5.w,),
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
    );
  }
}
