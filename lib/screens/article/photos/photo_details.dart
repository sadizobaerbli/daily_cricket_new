import 'package:dailycricket_nv/widgets/custom_appbar.dart';
import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:dailycricket_nv/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PhotoDetails extends StatelessWidget {
  PhotoDetails({Key? key}) : super(key: key);

  List<String> _images = [
    'asset/image_asset/pic_1.jpg',
    'asset/image_asset/pic_2.jpg',
    'asset/image_asset/picture.png',
    'asset/image_asset/picture_2.png',
    'asset/image_asset/pic_1.jpg',
    'asset/image_asset/pic_2.jpg',
    'asset/image_asset/picture_2.png',
    'asset/image_asset/pic_2.jpg',
    'asset/image_asset/picture.png',
    'asset/image_asset/picture_2.png',
  ];

  _mainCard(BuildContext context){
    return Container(
        height: MediaQuery.of(context).size.height - 180.h,
        padding: EdgeInsets.symmetric(horizontal: 23.w),
        child: StaggeredGridView.countBuilder(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) =>
          new Container(
            child: new Container(
              child: Image.asset(_images[index], fit: BoxFit.fill,),
            ),
          ),
          staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 1),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        )
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
      body: SingleChildScrollView(
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
              padding: EdgeInsets.symmetric(horizontal: 23.w),
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
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: Text('India lost the Test match Painfully',
              style: boldText(fontSize: 15.sp),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Published 1 hour ago',
                        style: regularText(fontSize: 11.sp, color: Grey),),
                      Text('2.9K views',
                        style: regularText(fontSize: 17.sp, color: Grey),),
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
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: Text('Related Photos',
                style: boldText(fontSize: 15.sp),),
            ),
            SizedBox(height: 12.h,),
            _mainCard(context),
          ],
        ),
      ),
    );
  }
}
