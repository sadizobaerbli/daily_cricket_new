import 'package:dailycricket_nv/common_widgets/custom_appbar.dart';
import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:dailycricket_nv/config/text_style.dart';
import 'package:dailycricket_nv/screens/fixture/upcoming_matches.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'finished_matches.dart';
import 'live_matches.dart';

class FixturePage extends StatefulWidget {
  const FixturePage({Key? key}) : super(key: key);

  @override
  _FixturePageState createState() => _FixturePageState();
}

class _FixturePageState extends State<FixturePage> {

  String _selected = 'live';

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

  _tabBar(){
    return Container(
      margin: EdgeInsets.only(bottom: 11.h),
      child: Container(
        height: 36.h, width: 414.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.r),
            bottomRight: Radius.circular(15.r),
          ),
          gradient: LinearGradient(
            colors: [
              PrimaryDeepGreen,
              PrimaryGreen,
            ],
          ),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(28.w, 10.h, 0.w, 10.h),
          child: Row(
            children: [
              InkWell(
                onTap: ()=> _onTabClick(tabName: 'live'),
                child: Text('live'.toUpperCase(),
                  style: _tabItemStyle(tabName: 'live'),),),
              SizedBox(width: 26.w,),
              InkWell(
                onTap: ()=> _onTabClick(tabName: 'upcoming'),
                child: Text('upcoming'.toUpperCase(),
                  style: _tabItemStyle(tabName: 'upcoming'),),),
              SizedBox(width: 26.w,),
              InkWell(
                onTap: ()=> _onTabClick(tabName: 'finished'),
                child: Text('finished'.toUpperCase(),
                  style: _tabItemStyle(tabName: 'finished'),),),
            ],
          ),
        ),
      ),
    );
  }

  _selectedView({String? tabName}){
    if(_selected == 'live'){ return LiveMatches(); }
    else if(_selected == 'upcoming'){ return UpcomingMatches(); }
    else if(_selected == 'finished'){ return FinishedMatches(); }
    else { return Container(); }
  }

  _seriesPage(){
    return Scaffold(
      backgroundColor: BasicWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(89.h), child: CustomAppbar(),
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _tabBar(),
            Expanded(child: _selectedView(tabName: _selected),),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return _seriesPage();
  }
}
