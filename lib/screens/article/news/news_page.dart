import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:dailycricket_nv/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'daily_series_updates.dart';


class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  String _selected = 'daily_updates';

  _tabBar(){
    return Container(
      child: Stack(
        children: [
          Container(
            height: 44.h, width: 280.w,
            child: Image.asset('asset/image_asset/secondary_tab.png',
              fit: BoxFit.cover,),
          ),
          Positioned(
            child: Container(
              width: 261.w,
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
          )
        ],
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
    if(_selected == 'daily_updates'){ return DailySeriesUpdates(); }
    else if(_selected == 'series_updates'){ return DailySeriesUpdates(); }
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
