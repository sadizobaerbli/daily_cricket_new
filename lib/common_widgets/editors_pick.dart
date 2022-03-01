import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:dailycricket_nv/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class EditorsPick extends StatefulWidget {
  final String? url, title, date;
  const EditorsPick({Key? key, this.url, this.title, this.date}) : super(key: key);

  @override
  _EditorsPickState createState() => _EditorsPickState();
}

class _EditorsPickState extends State<EditorsPick> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 252.w,
      margin: EdgeInsets.only(left: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 124.h, width: 250.w,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),),
              child: Image.network(widget.url!,
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
                Text(widget.title ?? " ",
                  maxLines: 1,
                  style: boldText(fontSize: 11.sp, lineHeight: 15.sp/11.sp),
                ),
                SizedBox(height: 2.sp,),
                Text(widget.date ?? " ",
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
