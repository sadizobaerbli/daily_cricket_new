import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:dailycricket_nv/config/strings.dart';
import 'package:dailycricket_nv/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Popular extends StatefulWidget {
  const Popular({Key? key}) : super(key: key);

  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Container(
          height: 251.h, width: double.infinity,
          margin: EdgeInsets.only(right: 15.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset('asset/image_asset/pic_1.jpg',
              fit: BoxFit.fill,),
          ),
        ),
        Positioned(
          left: 18.w,
          bottom: 13.h,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250.w,
                  child: Text(titleText,
                    maxLines: 1,
                    style: boldText(
                        fontSize: 15.sp, color: BasicWhite,
                        lineHeight: 20.sp/15.sp),
                  ),
                ),
                Container(
                  color: Grey.withOpacity(.2),
                  child: Row(
                    children: [
                      Text('1.3M Views',
                        maxLines: 1,
                        style: regularText(fontSize: 9.sp,
                            color: BasicWhite),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5.w, right: 4.sp),
                        height: 2.h, width: 2.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: BasicWhite,
                        ),
                      ),
                      Text('3 months ago',
                        maxLines: 1,
                        style: regularText(fontSize: 9.sp,
                            color: BasicWhite),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )

      ],
    );
  }
}
