
import 'package:dailycricket_nv/common_widgets/featured_videos.dart';
import 'package:dailycricket_nv/common_widgets/popular.dart';
import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:dailycricket_nv/config/strings.dart';
import 'package:dailycricket_nv/config/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  _popular() {
    return Container(
      margin: EdgeInsets.only(left: 15.w),
      child: Column(
        children: [
          Popular(),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }

  _featuredVideos() {
    return Container(
      padding: EdgeInsets.only(left: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 29.w),
            child: Text(
              'Featured Videos',
              style: boldText(fontSize: 15.sp),
            ),
          ),
          SizedBox(
            height: 13.h,
          ),
          Container(
            height: 180,
            child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return FeaturedVideos();
                }),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }

  _trendingVideos(){

    return Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 19.w,vertical: 21.h),
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: PrimaryGreen.withOpacity(.1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Trending Videos',style: boldText(fontSize: 15.sp,),),
                SizedBox(height: 21.h,),
                ListView.builder(
                    itemCount: 7,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 384.w,
                        margin: EdgeInsets.only(bottom: 13.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.r),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 78.h,
                              width: 86.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.r),
                                child: Image.asset(
                                  'asset/image_asset/picture_2.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 19.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    titleText,
                                    maxLines: 1,
                                    style: boldText(
                                      fontSize: 15.sp,
                                      lineHeight: 20.sp / 15.sp,
                                    ),
                                  ),
                                  Text(
                                    longText,
                                    maxLines: 2,
                                    style: semiBoldText(
                                      fontSize: 12.sp,
                                      lineHeight: 16.sp / 12.sp,
                                    ),
                                  ),
                                  Text(
                                    '3 months ago',
                                    maxLines: 1,
                                    style: regularText(fontSize: 8.sp, color: Grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            )
        ),
        SizedBox(height: 20.h,),
      ],
    );
  }

  _mainCard() {
    return Container(
      height: MediaQuery.of(context).size.height - 180.h,
      child: ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          _popular(),
          _featuredVideos(),
          _trendingVideos(),
          _featuredVideos(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _mainCard();
  }
}
