import 'package:dailycricket_nv/common_widgets/custom_appbar.dart';
import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:dailycricket_nv/config/text_style.dart';
import 'package:dailycricket_nv/screens/article/news/news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {

  String _selected = 'news';

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
      child: Stack(
        children: [
          Container(
            height: 36.h, width: 414.w,
            child: Image.asset('asset/image_asset/tab_background.png',
              fit: BoxFit.fill,),
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.fromLTRB(28.w, 10.h, 0.w, 10.h),
              child: Row(
                children: [
                  InkWell(
                    onTap: ()=> _onTabClick(tabName: 'news'),
                    child: Text('news'.toUpperCase(),
                      style: _tabItemStyle(tabName: 'news'),),),
                  SizedBox(width: 16.w,),
                  InkWell(
                    onTap: ()=> _onTabClick(tabName: 'photos'),
                    child: Text('photos'.toUpperCase(),
                      style: _tabItemStyle(tabName: 'photos'),),),
                  SizedBox(width: 16.w,),
                  InkWell(
                    onTap: ()=> _onTabClick(tabName: 'videos'),
                    child: Text('videos'.toUpperCase(),
                      style: _tabItemStyle(tabName: 'videos'),),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _selectedView({String? tabName}){
    if(_selected == 'news'){ return NewsScreen(); }
    else if(_selected == 'photos'){ return Container(); }
    else if(_selected == 'videos'){ return Container(); }
    else { return Container(); }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BasicWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(89.h), child: CustomAppbar(),
      ),

      body: Container(
        child: Column(
          children: [
            _tabBar(),
            _selectedView(tabName: _selected),
          ],
        ),
      ),
    );
  }
}
