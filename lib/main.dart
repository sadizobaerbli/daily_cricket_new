import 'package:dailycricket_nv/screens/article/article_page.dart';
import 'package:dailycricket_nv/screens/bottom_navigation_bar.dart';
import 'package:dailycricket_nv/screens/home/daily_updates_bloc/editors_pick_bloc.dart';
import 'package:dailycricket_nv/screens/home/featured_videos_bloc/featured_videos_bloc.dart';
import 'package:dailycricket_nv/screens/home/home_bloc/home_bloc.dart';
import 'package:dailycricket_nv/screens/home/network/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  runApp(
    MultiBlocProvider(
      child: MyApp(),
      providers: [
        BlocProvider(create: (context) => HomeBloc(repository: HomeRepository(),),),
        BlocProvider(create: (context) => FeaturedVideosBloc(repository: HomeRepository(),),),
        BlocProvider(create: (context) => EditorsPickBloc(repository: HomeRepository(),),),
      ],
    ),
  );
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
