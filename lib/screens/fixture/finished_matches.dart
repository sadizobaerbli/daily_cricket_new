import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:dailycricket_nv/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinishedMatches extends StatefulWidget {
  const FinishedMatches({Key? key}) : super(key: key);

  @override
  _FinishedMatchesState createState() => _FinishedMatchesState();
}

class _FinishedMatchesState extends State<FinishedMatches> {


  _view(){
    return Container(
      width: 333.w,
      margin: EdgeInsets.only(right: 15.w,bottom: 8.h, left: 15.w, top: 8.h),
      decoration: BoxDecoration(
        color: BasicWhite,
        boxShadow: [
          BoxShadow(
            color: Grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 8,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(12.r),
      ),

      child: Container(
        padding: EdgeInsets.fromLTRB(9.w, 13.h, 9.w, 12.h),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 3.sp),
                  child: Text('Stumps'.toUpperCase(),
                    style: boldText(fontSize: 9.sp, color: PrimaryRed),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8.w, right: 5.sp),
                  height: 4.h, width: 4.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Grey,
                  ),
                ),
                Text('3rd Test',
                  style: boldText(fontSize: 9.sp,),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8.w, right: 5.sp),
                  height: 4.h, width: 4.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Grey,
                  ),
                ),
                Text('Leeds',
                  style: boldText(fontSize: 9.sp, color: Grey),),
                Spacer(),
                ImageIcon(AssetImage('asset/icon_asset/pin.png'),size: 17.sp,color: BasicBlack,),

              ],
            ),
            SizedBox(height: 16.h,),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 2.w),
                  height: 29.h, width: 29.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: Image.asset('asset/image_asset/bd_flag.png',
                      fit: BoxFit.fill,),
                  ),
                ),

                SizedBox(width: 12.w,),
                Text('IND',
                  style: boldText(fontSize: 14.sp),),
                Spacer(),
                Text('',
                  style: TextStyle(fontWeight: FontWeight.w800,
                      color: Colors.grey, fontSize: 11.sp),),
                SizedBox(width: 21.w,),
                Text('212/8',
                  style: boldText(fontSize: 16.sp),),
                SizedBox(width: 7.w,),
              ],
            ),
            SizedBox(height: 11.h,),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 2.w),
                  height: 29.h, width: 29.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: Image.asset('asset/image_asset/bd_flag.png',
                      fit: BoxFit.fill,),
                  ),
                ),

                SizedBox(width: 12.w,),
                Text('IND',
                  style: boldText(fontSize: 14.sp),),
                Spacer(),
                Text('',
                  style: TextStyle(fontWeight: FontWeight.w800,
                      color: Colors.grey, fontSize: 11.sp),),
                SizedBox(width: 21.w,),
                Text('212/8',
                  style: boldText(fontSize: 16.sp),),
                SizedBox(width: 7.w,),
              ],
            ),
            SizedBox(height: 9.h,),
            Row(
              children: [
                SizedBox(width: 5.w,),
                Text('Day 2',
                  style: boldText(fontSize: 10.sp, color: Grey),
                ),
                Container(
                  margin: EdgeInsets.only(left: 6.w, right: 3.sp),
                  height: 4.h, width: 4.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Grey,
                  ),
                ),
                Text('Bangladesh won by 120 runs',
                  style: boldText(fontSize: 10.sp, color: PrimaryGreen),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8.w, right: 5.sp),
                  height: 4.h, width: 4.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Grey,
                  ),
                ),
                Text('CRR: 3.27',
                  style: boldText(fontSize: 10.sp, color: Grey),
                ),

              ],
            ),
            SizedBox(height: 10.h,),
          ],
        ),
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
