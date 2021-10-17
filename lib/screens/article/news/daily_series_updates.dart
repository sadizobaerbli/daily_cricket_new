import 'package:carousel_slider/carousel_slider.dart';
import 'package:dailycricket_nv/common_widgets/daily_updates.dart';
import 'package:dailycricket_nv/common_widgets/news_card.dart';
import 'package:dailycricket_nv/common_widgets/popular.dart';
import 'package:dailycricket_nv/common_widgets/trending.dart';
import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DailySeriesUpdates extends StatefulWidget {
  const DailySeriesUpdates({Key? key}) : super(key: key);

  @override
  _DailySeriesUpdatesState createState() => _DailySeriesUpdatesState();
}

class _DailySeriesUpdatesState extends State<DailySeriesUpdates> {

  int _current = 0;
  List<int> item = [1,2,4];

  _slider(){
    return Column(
      children: [
        Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlay: false,
                  disableCenter: true,
                  enableInfiniteScroll: false,
                  height: 200.h,
                  viewportFraction: .86,
                  onPageChanged: (index, reason) {

                    setState(() {
                      _current = index;
                    });

                  },
                ),

                itemCount: 3,
                itemBuilder: (BuildContext context, int index, int realIndex) {

                  return DailyUpdates();
                }
            ),
            Positioned.fill(
              top: 192.h,
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
                        color: _current == index ? PrimaryGreen : PrimaryGreen.withOpacity(.3),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h,),
      ],
    );
  }

  _trending(int size){

    return Column(
      children: [
        Column(
          children: List.generate(size, (index) => Container(
            margin: EdgeInsets.only(bottom: 8.h),
            child: Row(
              children: [
                SizedBox(width: 15.w,),
                Trending(),
                Spacer(),
                Trending(),
                SizedBox(width: 15.w,),
              ],
            ),
          ),),
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }

  _newsCard(int size){

    return Container(
      margin: EdgeInsets.only(left: 15.w,),
      child: ListView.builder(
          itemCount: size,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, i){
            return NewsCard();
          }),
    );
  }

  _popular(){

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

  _mainCard(){
    return Container(
      height: MediaQuery.of(context).size.height - 180.h,
      child: ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          _slider(),
          _newsCard(1),
          _popular(),
          _newsCard(2),
          _trending(2),
          _newsCard(2),
          _trending(1),
          _popular(),
          _newsCard(3),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _mainCard();
  }
}
