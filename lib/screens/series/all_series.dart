import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:dailycricket_nv/config/text_style.dart';
import 'package:dailycricket_nv/screens/series/series_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AllSeries extends StatefulWidget {
  const AllSeries({Key? key}) : super(key: key);

  @override
  _AllSeriesState createState() => _AllSeriesState();
}

class _AllSeriesState extends State<AllSeries> {

  String _selected = 'current';

  _tabBar(){
    return Container(
      height: 38.h, width: 336.w,
      margin: EdgeInsets.only(left: 17.w, right: 89.w, bottom: 11.h),
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
        width: 336.w,
        padding: EdgeInsets.fromLTRB(28.w, 10.h, 24.w, 11.h),
        child: Row(
          children: [
            InkWell(
              onTap: ()=> _onTabClick(tabName: 'current'),
              child: Text('current'.toUpperCase(),
                style: _tabItemStyle(tabName: 'current'),),),
            Spacer(),
            InkWell(
              onTap: ()=> _onTabClick(tabName: 'upcoming'),
              child: Text('upcoming'.toUpperCase(),
                style: _tabItemStyle(tabName: 'upcoming'),),),
            Spacer(),
            InkWell(
              onTap: ()=> _onTabClick(tabName: 'completed'),
              child: Text('completed'.toUpperCase(),
                style: _tabItemStyle(tabName: 'completed'),),),
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
    if(_selected == 'current'){ return SeriesCard(); }
    else if(_selected == 'upcoming'){ return SeriesCard(); }
    else if(_selected == 'completed'){ return SeriesCard(); }
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
