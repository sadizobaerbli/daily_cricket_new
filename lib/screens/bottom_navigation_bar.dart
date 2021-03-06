import '../../config/color_constants.dart';
import '../../config/text_style.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/series/series_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'article/article_page.dart';
import 'fixture/fixture_page.dart';
import 'more_option.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  String selectedTab = 'home';

  ///This section select the current selected item
  void _onTabSelect({String? tabName}) {
    setState(() {
      selectedTab = tabName!;
    });
  }

  ///This section refers the selected body
  dynamic _tabItemView() {
    if (selectedTab == 'home') {
      return HomeScreen();
    } else if (selectedTab == 'article') {
      return ArticlePage();
    } else if (selectedTab == 'series') {
      return SeriesPage();
    } else if (selectedTab == 'fixture') {
      return FixturePage();
    }
  }

  ///This section refers single navbar item
  _tabItem({String? title, ImageIcon? imageIcon}) {
    return InkWell(
      onTap: () => _onTabSelect(tabName: title),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageIcon!,
          SizedBox(
            height: 5.h,
          ),
          Text(
            title!.toUpperCase(),
            style: selectedTab == title
                ? boldText(
                    fontSize: 9.sp,
                    color: BasicWhite,
                  )
                : regularText(
                    fontSize: 9.sp,
                    color: BasicWhite,
                  ),
          ),
        ],
      ),
    );
  }

  ///This section refers the whole bottom nav and contains
  ///+ _tabItem
  Container _bottomNav(BuildContext context) {
    return Container(
      height: 60.h,
      width: 414.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r),
          topRight: Radius.circular(15.r),
        ),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            PrimaryDeepGreen,
            PrimaryGreen,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _tabItem(
            title: "home",
            imageIcon: ImageIcon(
              selectedTab == "home"
                  ? AssetImage('asset/icon_asset/home_select.png')
                  : AssetImage('asset/icon_asset/home.png'),
              size: selectedTab == "home" ? 26.sp : 24.sp,
              color: BasicWhite,
            ),
          ),
          _tabItem(
            title: "article",
            imageIcon: ImageIcon(
              selectedTab == 'article'
                  ? AssetImage('asset/icon_asset/article_select.png')
                  : AssetImage('asset/icon_asset/article.png'),
              size: selectedTab == 'article' ? 26.sp : 24.sp,
              color: BasicWhite,
            ),
          ),
          _tabItem(
            title: "series",
            imageIcon: ImageIcon(
              selectedTab == 'series'
                  ? AssetImage('asset/icon_asset/trophy_select.png')
                  : AssetImage('asset/icon_asset/trophy.png'),
              size: selectedTab == 'series' ? 26.sp : 24.sp,
              color: BasicWhite,
            ),
          ),
          _tabItem(
            title: "fixture",
            imageIcon: ImageIcon(
              selectedTab == 'fixture'
                  ? AssetImage('asset/icon_asset/cricket_select.png')
                  : AssetImage('asset/icon_asset/cricket.png'),
              size: selectedTab == 'fixture' ? 26.sp : 24.sp,
              color: BasicWhite,
            ),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return MoreOptions();
                },
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage('asset/icon_asset/more.png'),
                  size: 26.sp,
                  color: BasicWhite,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'more'.toUpperCase(),
                  style: boldText(
                    fontSize: 9.sp,
                    color: BasicWhite,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: 896.h,
                width: 414.w,
                child: _tabItemView(),
              );
            },
          ),
          Positioned(
            bottom: 0.h,
            child: _bottomNav(context),
          ),
        ],
      ),
    );
  }
}
