import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/color_constants.dart';
import '../../config/text_style.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/news_card.dart';
import '../../widgets/trending.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({Key? key}) : super(key: key);

  _newsCard(){

    return Container(
      child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, i){
            return NewsCard();
          }),
    );
  }

  _trending(){

    return Column(
      children: [
        Row(
          children: [
            Trending(),
            SizedBox(width: 8,),
            Trending(),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(89.h),
        child: CustomAppbar(
          radius: 15,
        ),
      ),
      body: Container(
        color: PrimaryGreen.withOpacity(.1),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 23.w),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ImageIcon(
                    AssetImage('asset/icon_asset/back.png'),
                    size: 38.sp,
                    color: BasicBlack,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: SizedBox(
                  height: 248.h, width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.r),
                    child: Image.asset(
                      'asset/image_asset/pic_2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text('It is a long established fact that a reader will be distracted by the readable content of a page..',
                  maxLines: 2,
                  style: boldText(fontSize: 15.sp),),
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.r),
                      child: SizedBox(
                        height: 44.h, width: 44.w,
                        child: Image.asset('asset/image_asset/pic_2.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Alamin Pranto',
                          style: mediumText(fontSize: 16.sp),),
                        SizedBox(height: 4.h),
                        Text('2.9K views',
                          style: regularText(fontSize: 13.sp, color: Grey),),
                      ],
                    ),
                    Spacer(),
                    Container(
                      height: 34.h, width: 116.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: Grey.withOpacity(.1),),
                        borderRadius: BorderRadius.circular(17.r),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 16.w,),
                          ImageIcon(
                            AssetImage('asset/icon_asset/share.png'),
                            color: Grey, size: 22.sp,
                          ),
                          Spacer(),
                          SizedBox(
                            height: 26.h, width: 26.w,
                            child: Image.asset('asset/image_asset/whats_app.png'),
                          ),
                          Spacer(),
                          SizedBox(
                            height: 26.h, width: 26.w,
                            child: Image.asset('asset/image_asset/facebook.png'),
                          ),
                          SizedBox(width: 12.w,),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Container(
                  padding: EdgeInsets.fromLTRB(13.w, 19.h, 8.w, 19.h),
                  decoration: BoxDecoration(
                    color: BasicWhite,
                    borderRadius: BorderRadius.circular(11.r),
                  ),
                  child: Column(
                    children: [
                      Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five"
                          """
                      centuries, but also the leap into electronic typesetting,remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.""",
                        style: regularText(fontSize: 14.sp, lineHeight: 21.sp/14.sp),),
                      SizedBox(height: 12.h,),
                      Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five"
                          """
                      centuries, but also the leap into electronic typesetting,remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.""",
                        style: regularText(fontSize: 14.sp, lineHeight: 21.sp/14.sp),),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text('Related Articles',
                  style: boldText(fontSize: 15.sp),),
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  children: [
                    _trending(),
                    _trending(),
                    SizedBox(height: 10.h,),
                    _newsCard(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
