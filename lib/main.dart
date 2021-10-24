import 'package:dailycricket_nv/screens/article/article_page.dart';
import 'package:dailycricket_nv/screens/bottom_navigation_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dailycricket_nv/screens/fixture/fixture_page.dart';
import 'package:dailycricket_nv/screens/home/view/home_screen.dart';
import 'package:dailycricket_nv/screens/series/series_page.dart';
import 'package:dailycricket_nv/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent, // sta
    statusBarIconBrightness: Brightness.light, // status bar icons' color
    statusBarBrightness: Brightness.light, //navigation bar icons' color
    systemNavigationBarIconBrightness: Brightness.dark,
  ),);

  runApp(MyApp(),);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: Size(414, 896),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/bottomNavigation',

        routes: {

          '/splashScreen': (_) => Splash(),
          '/bottomNavigation': (_) => BottomNavigation(),
          '/homeScreen': (_) => HomeScreen(),
          '/articlePage': (_) => ArticlePage(),
          '/seriesPage': (_) => SeriesPage(),
          '/fixturePage': (_) => FixturePage(),

        },
      ),
    );
  }
}
