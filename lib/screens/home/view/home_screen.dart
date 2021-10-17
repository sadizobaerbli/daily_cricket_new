import 'dart:ui';
import 'package:dailycricket_nv/common_widgets/daily_updates.dart';
import 'package:dailycricket_nv/common_widgets/editors_pick.dart';
import 'package:dailycricket_nv/common_widgets/featured_videos.dart';
import 'package:dailycricket_nv/common_widgets/live_card.dart';
import 'package:dailycricket_nv/common_widgets/news_card.dart';
import 'package:dailycricket_nv/common_widgets/popular.dart';
import 'package:dailycricket_nv/common_widgets/trending.dart';
import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:dailycricket_nv/config/text_style.dart';
import 'package:dailycricket_nv/screens/home/view/home_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scroll_to_index/scroll_to_index.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isSwitched = false;
  bool isExpanded = true;
  List<int> item = [1,2,4,6];
  AutoScrollController? _autoScrollController;
  final scrollDirection = Axis.vertical;

  bool get _isAppBarExpanded {
    return _autoScrollController!.hasClients &&
        _autoScrollController!.offset > (140 - kToolbarHeight);
  }

  _appBar(){

    return PreferredSize(
      preferredSize: Size.fromHeight(89.h),
      child: Stack(

        children: [

          Container(
            height: 89.h, width: 414.w,
            child: ClipRRect(
              borderRadius: !isExpanded ?
              BorderRadius.only(
                bottomLeft: Radius.circular(12.r),
                bottomRight: Radius.circular(15.r),) :
              BorderRadius.circular(0.r),
              child: Image.asset('asset/image_asset/background_1.png',
                fit: BoxFit.fill,),
            ),
          ),

          Positioned(
            top: 44.h,
            child: Container(
              height: 26.h, width: 414.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(width: 26.w,),
                  Container(
                    height: 26.h, width: 26.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: BasicWhite,
                    ),
                    child: Center(
                      child: ImageIcon(AssetImage('asset/icon_asset/pin.png'),
                        size: 15.sp, color: BasicBlack,),
                    ),
                  ),
                  Spacer(flex: 2,),

                  Container(
                    height: 28.h, width: 110.w,
                    child: Image.asset('asset/image_asset/logo.png'),
                  ),

                  Spacer(flex: 1,),

                  ImageIcon(AssetImage('asset/icon_asset/search.png'),
                    size: 20.sp,color: BasicWhite,),

                  SizedBox(width: 26.w,),

                  Stack(
                    children: [

                      InkWell(
                        onTap: (){
                          setState(() {
                            isSwitched = !isSwitched;
                          });
                        },
                        child: Container(
                          height: 20.h, width: 36.w,
                          decoration: BoxDecoration(
                            color: BasicWhite,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                        ),
                      ),
                      isSwitched ? Positioned(
                        left: 0,
                        child: Container(
                            height: 20.h, width: 24.w,
                            decoration: BoxDecoration(
                              color: PrimaryGreen,
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child: Center(
                              child: Text('BN',
                                style: TextStyle(
                                    fontSize: 7, fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              ),
                            )
                        ),
                      ) :
                      Positioned(
                        right: 0,
                        child: Container(
                            height: 20.h, width: 24.w,
                            decoration: BoxDecoration(
                              color: PrimaryRed,
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child: Center(
                              child: Text('EN',
                                style: TextStyle(
                                    fontSize: 7, fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              ),
                            )
                        ),
                      ),

                    ],
                  ),

                  SizedBox(width: 26.w,),

                ],
              ),
            ),
          ),
        ],
      ),
    );

  }

  _slider(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [

            Container(
              height: 92.h, width: 414.w,
              child: Image.asset('asset/image_asset/background_2.png',
                fit: BoxFit.fill,),
            ),

            Positioned(
              child: HomeSlider(),
            ),

          ],
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }

  _featuredVideos(){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 29.w),
          child: Text('Featured Videos',
            style: boldText(fontSize: 15.sp),
          ),
        ),
        SizedBox(
          height: 13.h,
        ),
        Container(
          height: 180,
          child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, i){
                return FeaturedVideos();
              }),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }

  _editorsPick(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 29.w),
          child: Text('Editors Pick',
            style: boldText(fontSize: 15.sp),
          ),
        ),
        SizedBox(
          height: 13.h,
        ),
        Container(
          height: 168.h,
          child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, i){
                return EditorsPick();
              }),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }

  _dailyUpdates(){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 29.w),
          child: Text('Daily Updates',
            style: boldText(fontSize: 15.sp),
          ),
        ),
        SizedBox(
          height: 13.h,
        ),
        Container(
          height: 164.h,
          child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, i){
                return DailyUpdates();
              }),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );

  }

  _newsCard(){

    return Container(
      child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, i){
            return NewsCard();
          }),
    );
  }

  _liveCard(){

    return Column(
      children: [
        LiveCard(),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }

  _trending(){

    return Column(
      children: [
        Row(
          children: [
            Trending(),
            Spacer(),
            Trending(),
            SizedBox(width: 15.w,),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }

  _popular(){

    return Column(
      children: [
        Popular(),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }

  _containerDecoration(){

    return BoxDecoration(
      color: PrimaryGreen.withOpacity(.1),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(45.r),
      ),
    );
  }


  @override
  void initState() {

    _autoScrollController = AutoScrollController(
      axis: scrollDirection,
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
    )..addListener(() =>
        _isAppBarExpanded
            ? isExpanded != false
            ? setState(() {isExpanded = false;},
        ) : {} : isExpanded != true ? setState(() {isExpanded = true;}) : {},
      );

    super.initState();
  }

  @override
  void dispose() {
    _autoScrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: BasicWhite,
      appBar: _appBar(),
      body: Container(
        child: ListView(
          controller: _autoScrollController,
          children: [
            _slider(),
            Container(
              padding: EdgeInsets.only(top: 26.h, left: 15.w, bottom: 81.h),
              decoration: _containerDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _featuredVideos(),
                  _editorsPick(),
                  _dailyUpdates(),
                  _trending(),
                  _liveCard(),
                  _newsCard(),
                  _popular(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
