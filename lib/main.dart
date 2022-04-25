import '../../screens/article/article_page.dart';
import '../../screens/article/photos/photo_details.dart';
import '../../screens/bottom_navigation_bar.dart';
import '../../providers/home_provider.dart';
import '../../services/home_repository.dart';
import '../../services/match_details_repository.dart';
import '../../screens/fixture/fixture_page.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/series/series_page.dart';
import '../../screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'controllers/editors_pick/editors_pick_bloc.dart';
import 'controllers/featured_videos/featured_videos_bloc.dart';
import 'controllers/home/home_bloc.dart';
import 'controllers/match_details/match_details_bloc.dart';

void main() {
  //=========Disabled landscape mode=========
  //-----------------------------------------

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarColor: Colors.transparent, // sta
      statusBarIconBrightness: Brightness.light, // status bar icons' color
      statusBarBrightness: Brightness.light, //navigation bar icons' color
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(
    //===============initialization section of controllers===============
    //-------------------------------------------------------------------

    MultiProvider(
      child: MyApp(),
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(
            repository: HomeRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => FeaturedVideosBloc(
            repository: HomeRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => EditorsPickBloc(
            repository: HomeRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => MatchDetailsBloc(
            repository: MatchDetailsRepository(),
          ),
        ),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      builder: () => MaterialApp(
        //=============initialization of screenutil package==============
        //---------------------------------------------------------------

        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: widget!,
          );
        },
        debugShowCheckedModeBanner: false,
        initialRoute: '/photoDetails',
        routes: {
          '/splashScreen': (_) => Splash(),
          '/bottomNavigation': (_) => BottomNavigation(),
          '/homeScreen': (_) => HomeScreen(),
          '/articlePage': (_) => ArticlePage(),
          '/seriesPage': (_) => SeriesPage(),
          '/fixturePage': (_) => FixturePage(),
          '/photoDetails': (_) => PhotoDetails(),
        },
      ),
    );
  }
}
