import '../../blocs/editors_pick/editors_pick_bloc.dart';
import '../../blocs/editors_pick/editors_pick_event.dart';
import '../../blocs/editors_pick/editors_pick_state.dart';
import '../../blocs/featured_videos/featured_videos_bloc.dart';
import '../../blocs/featured_videos/featured_videos_event.dart';
import '../../blocs/featured_videos/featured_videos_state.dart';
import '../../blocs/home/home_bloc.dart';
import '../../blocs/home/home_event.dart';
import '../../blocs/home/home_state.dart';
import '../../config/color_constants.dart';
import '../../widgets/trending.dart';
import '../../config/text_style.dart';
import '../../widgets/featured_videos.dart';
import '../../widgets/daily_updates.dart';
import '../../widgets/editors_pick.dart';
import '../../widgets/live_card.dart';
import '../../widgets/news_card.dart';
import '../../widgets/popular.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'editors_pick_skeleton.dart';
import 'featured_videos_skeleton.dart';
import 'home_slider.dart';
import 'home_slider_skeleton.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isSwitched = false;
  bool isExpanded = true;
  HomeBloc? homeBloc;
  FeaturedVideosBloc? featuredVideosBloc;
  EditorsPickBloc? editorsPickBloc;
  List<int> item = [1,2,4,6];
  AutoScrollController? _autoScrollController;

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
                        size: 15.sp, color: Grey,),
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

                  InkWell(
                    onTap: (){
                      setState(() {
                        isSwitched = !isSwitched;
                      });
                    },
                    child: Stack(
                      children: [

                        Container(
                          height: 20.h, width: 36.w,
                          decoration: BoxDecoration(
                            color: BasicWhite,
                            borderRadius: BorderRadius.circular(15.r),
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
              child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return HomeSliderSkeleton();
                    } else if (state is HomeFailure) {
                      return Container(
                        height: 92.h, width: 414.w,
                        child: Center(child: Text('${state.errorMessage}')),
                      );
                    } else if (state is HomeSuccess) {

                      return HomeSlider(items: state.liveMatchesDataModel.response!.items,);
                    }
                    return Container();
                  }),
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
          height: 164,
          child: BlocBuilder<FeaturedVideosBloc, FeaturedVideosState>(
              builder: (context, state) {
                if (state is FeaturedVideosLoading) {
                  return FeaturedVideosSkeleton();
                } else if (state is FeaturedVideosFailure) {
                  return Container(
                    height: 92.h, width: 414.w,
                    child: Center(child: Text('${state.errorMessage}')),
                  );
                } else if (state is FeaturedVideosSuccess) {

                  return ListView.builder(
                      itemCount: state.featuredVideosModel.data!.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, i){
                        return FeaturedVideos(
                          title: state.featuredVideosModel.data![i].title,
                          url: state.featuredVideosModel.data![i].url,
                          createdAt: state.featuredVideosModel.data![i].createdAt,
                        );
                      });
                }
                return Container();
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
          child: BlocBuilder<EditorsPickBloc, EditorsPickState>(
              builder: (context, state) {
                if (state is EditorsPickLoading) {
                  return EditorsPickSkeleton();
                } else if (state is EditorsPickFailure) {
                  return Container(
                    height: 92.h, width: 414.w,
                    child: Center(child: Text('${state.errorMessage}')),
                  );
                } else if (state is EditorsPickSuccess) {

                  return ListView.builder(
                      itemCount: state.editorsPickModel.data!.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, i){
                        return EditorsPick(
                          url: state.editorsPickModel.data![i].image,
                          title: state.editorsPickModel.data![i].title,
                          date: state.editorsPickModel.data![i].date,
                        );
                      });
                }
                return Container();
              }),
        ),
        SizedBox(
          height: 20.h,
        ),

      ],
    );
  }

  _dailyUpdatesPick(){

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
          height: 2.h,
        ),
        Container(
          height: 175.h,
          child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, i){
                return DailyUpdates(initialPaddingLeft: 16.w,);
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
            SizedBox(width: 15.w,),
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
      axis: Axis.vertical,
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
    )..addListener(() =>
        _isAppBarExpanded
            ? isExpanded != false
            ? setState(() {isExpanded = false;},
        ) : {} : isExpanded != true ? setState(() {isExpanded = true;}) : {},
      );

    homeBloc = context.read<HomeBloc>();
    featuredVideosBloc = context.read<FeaturedVideosBloc>();
    editorsPickBloc = context.read<EditorsPickBloc>();
    homeBloc!.add(LiveMatchesEvent());
    featuredVideosBloc!.add(FeaturedVideoEvent());
    editorsPickBloc!.add(EditorPickEvent());
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
              padding: EdgeInsets.only(top: 26.h, left: 0.w, bottom: 81.h),
              decoration: _containerDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _featuredVideos(),
                  _editorsPick(),
                  _dailyUpdatesPick(),
                  _trending(),
                  _liveCard(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: _newsCard(),
                  ),
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
