import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:dailycricket_nv/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'daily_series_photos.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({Key? key}) : super(key: key);

  @override
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {

  String _selected = 'daily_updates';

  _tabBar(){
    return Container(
      height: 38.h,
      margin: EdgeInsets.only(left: 17.w, right: 141.w, bottom: 11.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        gradient: LinearGradient(
          colors: [
            PrimaryGreen,
            PrimaryDeepGreen,
          ],
        ),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(28.w, 10.h, 24.w, 11.h),
        child: Row(
          children: [
            InkWell(
              onTap: ()=> _onTabClick(tabName: 'daily_updates'),
              child: Text('daily updates'.toUpperCase(),
                style: _tabItemStyle(tabName: 'daily_updates'),),),
            Spacer(),
            InkWell(
              onTap: ()=> _onTabClick(tabName: 'series_updates'),
              child: Text('series updates'.toUpperCase(),
                style: _tabItemStyle(tabName: 'series_updates'),),),
          ],
        ),
      ),
    );
  }

  _onTabClick({String? tabName}){
    setState(() {
      _selected = tabName!;
    });
  }

  _tabItemStyle({String? tabName}){
    if(_selected == tabName){
      return boldText(fontSize: 12.sp, color: BasicWhite);
    } else{
      return semiBoldText(fontSize: 12.sp, color: Grey);
    }
  }

  _selectedView({String? tabName}){
    if(_selected == 'daily_updates'){ return DailySeriesPhotos(); }
    else if(_selected == 'series_updates'){ return DailySeriesPhotos(); }
    else{ return Container(); }
  }

  _mainPage(){
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _tabBar(),
        _selectedView(tabName: _selected),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _mainPage();
  }
}
