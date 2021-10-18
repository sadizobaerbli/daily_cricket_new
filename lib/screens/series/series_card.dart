import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:dailycricket_nv/config/strings.dart';
import 'package:dailycricket_nv/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SeriesCard extends StatefulWidget {
  const SeriesCard({Key? key}) : super(key: key);

  @override
  _SeriesCardState createState() => _SeriesCardState();
}

class _SeriesCardState extends State<SeriesCard> {

  _view(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(17.w, 0.h, 17.w, 19.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 187.h, width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),),
              child: Image.asset('asset/image_asset/pic_2.jpg',
                fit: BoxFit.fill,),
            ),
          ),
          Container(
            height: 64.h, width: double.infinity,
            padding: EdgeInsets.fromLTRB(24.w, 4.h, 34.w, 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.r),
                bottomLeft: Radius.circular(20.r),
              ),
              gradient: LinearGradient(
                colors: [
                  PrimaryDeepGreen,
                  PrimaryGreen,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titleText,
                  maxLines: 1,
                  style: boldText(
                      fontSize: 17.sp,
                      color: BasicWhite,
                      lineHeight: 22.sp/17.sp),
                ),
                SizedBox(height: 2.sp,),
                Text('Scheduled at 4:00 PM',
                  maxLines: 1,
                  style: semiBoldText(fontSize: 10.sp, color: Grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _allViews(){

    return Container(
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, i){
            return _view();
          }),
    );
  }

  _mainCard(){
    return Container(
      height: MediaQuery.of(context).size.height - 180.h,
      child: ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          _allViews(),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return _mainCard();
  }
}
