import 'package:carousel_slider/carousel_slider.dart';
import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:dailycricket_nv/config/text_style.dart';
import 'package:dailycricket_nv/screens/home/data_models/live_matches_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class HomeSlider extends StatefulWidget {
  final List<Item>? items;
  HomeSlider({this.items});

  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {

  int _current = 0;

  _slider(){


    return Stack(
      clipBehavior: Clip.none, children: <Widget>[

        CarouselSlider.builder(
            options: CarouselOptions(
              autoPlay: false,
              enableInfiniteScroll: false,
              height: 200.h,
              viewportFraction: .8,
              onPageChanged: (index, reason) {

                setState(() {
                  _current = index;
                });

              },
            ),

            itemCount: widget.items!.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {

              String teamAOvers = widget.items![index].teama!.overs ?? "";
              teamAOvers = teamAOvers != "" ? "(" + teamAOvers + " ov)":  "";

              String teamBOvers = widget.items![index].teamb!.overs ?? "";
              teamBOvers = teamBOvers != "" ? "(" + teamBOvers + " ov)":  "";

              return InkWell(
                onTap:() {},
                child: Container(
                  width: 333.w,
                  margin: EdgeInsets.only(right: 15.w,bottom: 20.h),
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
                              child: Text(
                                widget.items![index].gameStateStr!.
                                toUpperCase(),
                                style: boldText(
                                    fontSize: 9.sp,
                                    color: PrimaryRed,
                                ),
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
                            Text(widget.items![index].competition!.abbr!
                                .toUpperCase(),
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
                            Text(widget.items![index].venue!.location!
                                .toUpperCase(),
                              style: boldText(
                                  fontSize: 9.sp,
                                color: Grey,
                              ),
                            ),
                            Spacer(),
                            ImageIcon(
                              AssetImage('asset/icon_asset/pin.png'),
                              size: 17.sp,
                              color: BasicBlack,
                            ),
                            SizedBox(width: 11.w,),
                            Container(
                              padding: EdgeInsets.fromLTRB(8.w, 4.h, 8.w, 5.h),
                              margin: EdgeInsets.only(right: 11.w),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5.r)
                              ),
                              child: Text(
                                widget.items![index].statusStr!.toUpperCase(),
                                style: boldText(
                                    fontSize: 8.sp,
                                    color: BasicWhite,
                                ),
                              ),
                            ),
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
                                child: Image.network(
                                  widget.items![index].teama!.logoUrl ?? "",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),

                            SizedBox(width: 12.w,),
                            Text(
                              widget.items![index].teama!.name!.
                              substring(0,3).toUpperCase(),
                              style: boldText(fontSize: 14.sp,
                              ),
                            ),
                            Spacer(),
                            Text(teamAOvers,
                              style: TextStyle(fontWeight: FontWeight.w800,
                                  color: Colors.grey, fontSize: 11.sp,
                              ),
                            ),
                            SizedBox(width: 21.w,),
                            Text(widget.items![index].teama!.scores ?? "",
                              style: boldText(fontSize: 16.sp),
                            ),
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
                                child: Image.network(
                                  widget.items![index].teamb!.logoUrl ?? "",
                                  fit: BoxFit.fill,),
                              ),
                            ),

                            SizedBox(width: 12.w,),
                            Text(
                              widget.items![index].teamb!.name!.
                              substring(0,3).toUpperCase(),
                              style: boldText(fontSize: 14.sp),
                            ),
                            Spacer(),
                            Text(teamBOvers,
                              style: TextStyle(fontWeight: FontWeight.w800,
                                  color: Colors.grey, fontSize: 11.sp,
                              ),
                            ),
                            SizedBox(width: 21.w,),
                            Text(widget.items![index].teamb!.scores ?? "",
                              style: boldText(fontSize: 16.sp),
                            ),
                            SizedBox(width: 7.w,),
                          ],
                        ),
                        SizedBox(height: 9.h,),
                        Row(
                          children: [
                            SizedBox(width: 5.w,),
                            Text(widget.items![index].statusNote ?? "",
                              style: boldText(fontSize: 9.sp, color: Grey),
                            ),
                            /*Container(
                              margin: EdgeInsets.only(left: 8.w, right: 5.sp),
                              height: 4.h, width: 4.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Grey,
                              ),
                            ),
                            Text('',
                              style: boldText(fontSize: 9.sp,),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 14.w, right: 5.sp),
                              height: 4.h, width: 4.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Grey,
                              ),
                            ),
                            Text('',
                              style: boldText(fontSize: 9.sp, color: Grey),
                            ),*/

                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Row(
                          children: [
                            Container(
                              width: 146.w, height: 20.h,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8.r)
                              ),
                              child: Center(
                                child: Text('Schedule',
                                  style: semiBoldText(
                                      fontSize: 9.sp, color: Grey),
                                ),
                              ),
                            ),
                            SizedBox(width: 6.h,),
                            Container(
                              width: 146.w, height: 20.h,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8.r)
                              ),
                              child: Center(
                                child: Text('Report',
                                  style: semiBoldText(
                                      fontSize: 9.sp,
                                      color: Grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
        ),
        Positioned.fill(
          top: 192.h,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.items!.map((url) {
                int index = widget.items!.indexOf(url);
                return Container(
                  margin: EdgeInsets.only(right: 4),
                  width: 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ?
                    PrimaryGreen : PrimaryGreen.withOpacity(.3),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return _slider();
  }
}
