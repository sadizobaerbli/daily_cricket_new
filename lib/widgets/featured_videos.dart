import '../../config/color_constants.dart';
import '../../config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedVideos extends StatelessWidget {
  final String? title, url, createdAt;
  const FeaturedVideos({
    Key? key,
    this.title,
    this.createdAt,
    this.url,
  }) : super(key: key);

  ///This section generates thumb-nil image
  String _getThumbImage({String? link}) {
    if(link != ""){
      var divider = link!.split('/');
      String videoId = divider[4].split("?")[0];
      String thumbingImageUrl =
          'https://img.youtube.com/vi/$videoId/hqdefault.jpg';

      print(thumbingImageUrl);
      return thumbingImageUrl;
    }
    else{
      return link ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 234.w,
      margin: EdgeInsets.only(left: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 134.h,
            width: 234.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.network(
                _getThumbImage(link: url ?? ""),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Container(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              title ?? "",
              maxLines: 2,
              style: semiBoldText(
                fontSize: 12.sp,
                lineHeight: 16.sp / 12.sp,
              ),
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Container(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              createdAt ?? "",
              maxLines: 1,
              style: regularText(
                fontSize: 8.sp,
                color: Grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
