import 'package:dailycricket_nv/widgets/custom_appbar.dart';
import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:dailycricket_nv/config/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'all_series.dart';

class SeriesPage extends StatefulWidget {
  const SeriesPage({Key? key}) : super(key: key);

  @override
  _SeriesPageState createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {


  String _selected = 'domestic';

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
                onTap: ()=> _onTabClick(tabName: 'domestic'),
                child: Text('domestic'.toUpperCase(),
                  style: _tabItemStyle(tabName: 'domestic'),),),
              SizedBox(width: 26.w,),
              InkWell(
                onTap: ()=> _onTabClick(tabName: 'international'),
                child: Text('international'.toUpperCase(),
                  style: _tabItemStyle(tabName: 'international'),),),
            ],
          ),
        ),
      ),
    );
  }

  _selectedView({String? tabName}){
    if(_selected == 'domestic'){ return AllSeries(); }
    else if(_selected == 'international'){ return AllSeries(); }
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
