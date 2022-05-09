import 'package:dailycricket_nv/screens/match_details/commentary_card.dart';
import 'package:dailycricket_nv/screens/match_details/oneside_scoreboard.dart';
import '../../blocs/match_details/match_details_state.dart';
import '../../models/slider_model.dart';
import '../../widgets/custom_appbar.dart';
import '../../config/color_constants.dart';
import '../../config/skeleton.dart';
import '../../config/text_style.dart';
import '../../blocs/match_details/match_details_bloc.dart';
import '../../blocs/match_details/match_details_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MatchDetails extends StatefulWidget {
  final SliderModel sliderModel;
  const MatchDetails({Key? key, required this.sliderModel}) : super(key: key);

  @override
  _MatchDetailsState createState() => _MatchDetailsState();
}

class _MatchDetailsState extends State<MatchDetails> {
  List<String> tabItems = ['Live', 'Scoreboard', 'Commentary'];
  String selectedItem = 'Live';
  TextStyle selectedStyle = boldText(fontSize: 12.sp, color: BasicWhite);
  TextStyle unselectedStyle = semiBoldText(fontSize: 12.sp, color: Grey);

  _selectChild(String item) {
    if (item == 'Live') {
      context.read<MatchDetailsBloc>().add(
            MatchDetailsLiveEvent(matchId: widget.sliderModel.matchId!),
          );
      return _liveSection();
    } else if (item == 'Scoreboard') {
      context.read<MatchDetailsBloc>().add(
            MatchDetailsScoreboardEvent(matchId: widget.sliderModel.matchId!),
          );
      return _scoreboardSection();
    } else {
      return _scoreboardSection();
    }
  }

  _matchDetailsLoading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40.h),
        Center(
          child: Container(
            width: 371.w,
            padding: EdgeInsets.fromLTRB(9.w, 23.h, 9.w, 22.h),
            margin: EdgeInsets.only(bottom: 20.h),
            decoration: BoxDecoration(
              color: BasicWhite,
              boxShadow: [
                BoxShadow(
                  color: Grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 8.w),
                    RoundedSkeleton(
                      height: 16,
                      width: 140,
                    ),
                    Spacer(),
                    RoundedSkeleton(
                      height: 16,
                      width: 80,
                    ),
                    SizedBox(width: 8.w),
                  ],
                ),
                SizedBox(height: 21.h),
                Row(
                  children: [
                    SizedBox(width: 8.w),
                    RoundedSkeleton(
                      height: 16,
                      width: 80,
                    ),
                    Spacer(),
                    RoundedSkeleton(
                      height: 16,
                      width: 80,
                    ),
                    SizedBox(width: 7.w),
                  ],
                ),
                SizedBox(height: 21.h),
                Row(
                  children: [
                    SizedBox(width: 8.w),
                    RoundedSkeleton(
                      height: 16,
                      width: 240,
                    ),
                  ],
                ),
                SizedBox(height: 21.h),
                Row(
                  children: [
                    SizedBox(width: 8.h),
                    RoundedSkeleton(
                      height: 16,
                      width: 140,
                    ),
                    SizedBox(width: 16.h),
                    RoundedSkeleton(
                      height: 16,
                      width: 140,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _liveSection() {
    return BlocBuilder<MatchDetailsBloc, MatchDetailsState>(
      builder: (context, state) {
        if (state is MatchDetailsLoading) {
          return _matchDetailsLoading();
        } else if (state is MatchDetailsLive) {
          return ListView.builder(
              itemCount: state.overWiseCommentary.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              reverse: true,
              itemBuilder: (context, index) {
                return CommentaryCard(
                    overWiseCommentary: state.overWiseCommentary[index],
                );
              },
          );
        } else {
          return Container();
        }
      },
    );
  }

  _scoreboardSection() {
    return BlocBuilder<MatchDetailsBloc, MatchDetailsState>(
      builder: (context, state) {
        if (state is MatchDetailsLoading) {
          return _matchDetailsLoading();
        } else if (state is MatchDetailsScoreboard) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.matchDetailsScoreboardModel.response!.innings!.length,
                itemBuilder: (context, index){
                  return OneSideScoreboard(
                    inning: state.matchDetailsScoreboardModel.response!.innings![index],
                  );
                },
              ),
              SizedBox(height: 50.h),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(89.h),
        child: CustomAppbar(
          radius: 15,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 23.w),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: ImageIcon(
                  AssetImage('asset/icon_asset/back.png'),
                  size: 38.sp,
                  color: BasicBlack,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 371.w,
                margin: EdgeInsets.only(
                  bottom: 20.h,
                ),
                decoration: BoxDecoration(
                  color: BasicWhite,
                  boxShadow: [
                    BoxShadow(
                      color: Grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(9.w, 13.h, 9.w, 12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 3.sp),
                            child: Text(
                              '${widget.sliderModel.gameStateStr}'
                                  .toUpperCase(),
                              style: boldText(
                                fontSize: 9.sp,
                                color: PrimaryRed,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8.w, right: 5.sp),
                            height: 4.h,
                            width: 4.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Grey,
                            ),
                          ),
                          Text(
                            '${widget.sliderModel.competitionAbbr}',
                            style: boldText(
                              fontSize: 9.sp,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8.w, right: 5.sp),
                            height: 4.h,
                            width: 4.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Grey,
                            ),
                          ),
                          Text(
                            '${widget.sliderModel.venueLocation}'.toUpperCase(),
                            style: boldText(
                              fontSize: 9.sp,
                              color: Grey,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {},
                            child: ImageIcon(
                              AssetImage('asset/icon_asset/pin.png'),
                              size: 17.sp,
                              color: Grey,
                            ),
                          ),
                          SizedBox(
                            width: 11.w,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(8.w, 4.h, 8.w, 5.h),
                            margin: EdgeInsets.only(right: 11.w),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Text(
                              '${widget.sliderModel.gameStr}',
                              style: boldText(
                                fontSize: 8.sp,
                                color: BasicWhite,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 2.w),
                            height: 29.h,
                            width: 29.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.r),
                              child: Image.network(
                                '${widget.sliderModel.teamALogoUrl}',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text(
                            '${widget.sliderModel.teamAName}'
                                .substring(0, 3)
                                .toUpperCase(),
                            style: boldText(
                              fontSize: 14.sp,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '${widget.sliderModel.teamAOver}',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.grey,
                              fontSize: 11.sp,
                            ),
                          ),
                          SizedBox(
                            width: 21.w,
                          ),
                          Text(
                            "${widget.sliderModel.teamAScore}",
                            style: boldText(fontSize: 16.sp),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 2.w),
                            height: 29.h,
                            width: 29.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.r),
                              child: Image.network(
                                "${widget.sliderModel.teamBLogoUrl}",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text(
                            '${widget.sliderModel.teamBName}'
                                .substring(0, 3)
                                .toUpperCase(),
                            style: boldText(fontSize: 14.sp),
                          ),
                          Spacer(),
                          Text(
                            '${widget.sliderModel.teamBOver}',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.grey,
                              fontSize: 11.sp,
                            ),
                          ),
                          SizedBox(
                            width: 21.w,
                          ),
                          Text(
                            "${widget.sliderModel.teamBScore}",
                            style: boldText(fontSize: 16.sp),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            widget.sliderModel.statusNote == null
                                ? ''
                                : '${widget.sliderModel.statusNote!.split(':')[0]}',
                            style: boldText(fontSize: 9.sp, color: Grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.sp),
                        child: Text(
                          '${widget.sliderModel.venueLocation}'.toUpperCase(),
                          style: boldText(
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 35.h,
              width: 230,
              margin: EdgeInsets.only(left: 23.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.r),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [PrimaryGreen, PrimaryDeepGreen],
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Row(
                children: List.generate(
                  3,
                  (index) => InkWell(
                    onTap: () {
                      setState(() {
                        selectedItem = tabItems[index];
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: Text(
                        tabItems[index],
                        style: selectedItem == tabItems[index]
                            ? selectedStyle
                            : unselectedStyle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            _selectChild(selectedItem),
          ],
        ),
      ),
    );
  }
}
