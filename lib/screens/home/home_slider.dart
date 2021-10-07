
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class HomeSlider extends StatefulWidget {

  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {

  int _current = 0;
  List<int> item = [1,2,4];

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[

        CarouselSlider.builder(
            options: CarouselOptions(
              autoPlay: false,
              enableInfiniteScroll: false,
              height: 173.h,
              viewportFraction: .8,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return InkWell(
                onTap:() {},
                child: Container(
                  height: 173.h, width: 333.w,
                  margin: EdgeInsets.only(right: 14.w),
                  decoration: BoxDecoration(
                    color: BasicWhite,
                    boxShadow: [
                      BoxShadow(
                        color: BasicBlack.withOpacity(.9),
                        blurRadius: .5,
                        spreadRadius: -.5
                      )
                    ],
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(14.sp),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Stumps'.toUpperCase(),
                              style: TextStyle(fontWeight: FontWeight.w800,
                                  color: Colors.red, fontSize: 9.sp),),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8.w),
                              height: 6.h, width: 6.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                            ),
                            Text('3rd Test',
                              style: TextStyle(fontWeight: FontWeight.w800,
                                  color: Colors.black, fontSize: 9.sp),),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8.w),
                              height: 6.h, width: 6.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                            ),
                            Text('Leeds',
                              style: TextStyle(fontWeight: FontWeight.w600,
                                  color: Colors.grey, fontSize: 9.sp),),
                            Spacer(),
                            ImageIcon(AssetImage('asset/icon_asset/pin.png'),size: 17.sp,color: BasicBlack,),
                            SizedBox(width: 6.w,),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8.r)
                              ),
                              child: Text('Live'.toUpperCase(),
                                style: TextStyle(fontWeight: FontWeight.w800,
                                    color: Colors.white, fontSize: 8.sp),),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h,),
                        Row(
                          children: [
                            Container(
                              height: 30.h, width: 30.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 12.w,),
                            Text('IND',
                              style: TextStyle(fontWeight: FontWeight.w800,
                                  color: Colors.black, fontSize: 14.sp),),
                            Spacer(),
                            Text('',
                              style: TextStyle(fontWeight: FontWeight.w800,
                                  color: Colors.grey, fontSize: 11.sp),),
                            SizedBox(width: 6.w,),
                            Text('212/8',
                              style: TextStyle(fontWeight: FontWeight.w800,
                                  color: Colors.black, fontSize: 14.sp),),
                          ],
                        ),
                        SizedBox(height: 6.h,),
                        Row(
                          children: [
                            Container(
                              height: 30.h, width: 30.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 12.w,),
                            Text('BAN',
                              style: TextStyle(fontWeight: FontWeight.w800,
                                  color: Colors.black, fontSize: 14.sp),),
                            Spacer(),
                            Text('(129 ov)',
                              style: TextStyle(fontWeight: FontWeight.w800,
                                  color: Colors.grey, fontSize: 11.sp),),
                            SizedBox(width: 6.w,),
                            Text('212/8',
                              style: TextStyle(fontWeight: FontWeight.w800,
                                  color: Colors.black, fontSize: 14.sp),),
                          ],
                        ),
                        SizedBox(height: 6.h,),
                        Row(
                          children: [
                            Text('Day 2',
                              style: TextStyle(fontWeight: FontWeight.w800,
                                  color: Colors.grey, fontSize: 9.sp),),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8.w),
                              height: 6.h, width: 6.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                            ),
                            Text('India lead by 120 runs',
                              style: TextStyle(fontWeight: FontWeight.w800,
                                  color: Colors.black, fontSize: 9.sp),),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8.w),
                              height: 6.h, width: 6.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                            ),
                            Text('CRR: 3.27',
                              style: TextStyle(fontWeight: FontWeight.w600,
                                  color: Colors.grey, fontSize: 9.sp),),
                          ],
                        ),
                        SizedBox(height: 8.h,),
                        Row(
                          children: [
                            Container(
                              width: 140.w, height: 20.h,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8.r)
                              ),
                              child: Center(
                                child: Text('Schedule',
                                  style: TextStyle(fontWeight: FontWeight.w600,
                                      color: Colors.black, fontSize: 8.sp),),
                              ),
                            ),
                            SizedBox(width: 8.h,),
                            Container(
                              width: 140.w, height: 20.h,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8.r)
                              ),
                              child: Center(
                                child: Text('Report',
                                  style: TextStyle(fontWeight: FontWeight.w600,
                                      color: Colors.black, fontSize: 8.sp),),
                              ),
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
        ),
        Positioned.fill(
          bottom: -30.h,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: item.map((url) {
                int index = item.indexOf(url);
                return Container(
                  margin: EdgeInsets.only(right: 4),
                  width: 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Colors.green : Colors.green.shade50,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );

  }
}
