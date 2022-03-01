import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:dailycricket_nv/config/strings.dart';
import 'package:dailycricket_nv/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LiveCard extends StatefulWidget {
  const LiveCard({Key? key}) : super(key: key);

  @override
  _LiveCardState createState() => _LiveCardState();
}

class _LiveCardState extends State<LiveCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 15.w, right: 15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 187.h, width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),),
              child: Image.asset('asset/image_asset/pic_2.jpg',
                fit: BoxFit.fill,),
            ),
          ),
          Stack(
            clipBehavior: Clip.none, children: [
            Container(
              height: 64.h, width: double.infinity,
              padding: EdgeInsets.fromLTRB(24.w, 4.h, 34.w, 12.h),
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
                    style: boldText(fontSize: 17.sp, lineHeight: 22.sp/17.sp),
                  ),
                  SizedBox(height: 2.sp,),
                  Text('3 months ago',
                    maxLines: 1,
                    style: semiBoldText(fontSize: 10.sp, color: Grey),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 19.w,
              bottom: 40.h,
              child: Container(
                height: 48.h, width: 48.w,
                child: Image.asset('asset/icon_asset/play.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
          ),
        ],
      ),
    );
  }
}
