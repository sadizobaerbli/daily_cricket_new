
import 'package:dailycricket_nv/controllers/match_details/match_details_bloc.dart';
import 'package:dailycricket_nv/controllers/match_details/match_details_event.dart';
import 'package:dailycricket_nv/controllers/match_details/match_details_state.dart';
import 'package:dailycricket_nv/models/slider_model.dart';
import 'package:dailycricket_nv/widgets/custom_appbar.dart';
import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:dailycricket_nv/config/skeleton.dart';
import 'package:dailycricket_nv/config/text_style.dart';
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

  selectChild(String item) {
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

  _scoreColor(dynamic score) {
    if (score == 'w') {
      return PrimaryRed;
    } else if (score == 4) {
      return PrimaryBlue;
    } else if (score == 6) {
      return PrimaryGreen;
    } else {
      return Grey.withOpacity(.4);
    }
  }

  _liveSection() {
    return BlocBuilder<MatchDetailsBloc, MatchDetailsState>(
      builder: (context, state) {
        if (state is MatchDetailsLoading) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
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
                    padding: EdgeInsets.fromLTRB(9.w, 23.h, 9.w, 22.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 8.w,
                            ),
                            RoundedSkeleton(
                              height: 16,
                              width: 140,
                            ),
                            Spacer(),
                            RoundedSkeleton(
                              height: 16,
                              width: 80,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 21.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 8.w,
                            ),
                            RoundedSkeleton(
                              height: 16,
                              width: 80,
                            ),
                            Spacer(),
                            RoundedSkeleton(
                              height: 16,
                              width: 80,
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 21.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 8.w,
                            ),
                            RoundedSkeleton(
                              height: 16,
                              width: 240,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 21.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 8.h,
                            ),
                            RoundedSkeleton(
                              height: 16,
                              width: 140,
                            ),
                            SizedBox(
                              width: 16.h,
                            ),
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
              ),
              /*Container(
                  height: 35.h, width: 230,
                  margin: EdgeInsets.only(left: 23.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.r),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [PrimaryGreen,PrimaryDeepGreen]
                      )
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: Row(
                    children: List.generate(3, (index) => InkWell(
                      onTap: (){
                        setState(() {
                          selectedItem = tabItems[index];
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 15.w),
                        child: Text(tabItems[index],
                          style: selectedItem == tabItems[index] ? selectedStyle : unselectedStyle,),
                      ),
                    ),),
                  ),
                ),
                SizedBox(height: 16.h,),
                Center(
                  child: Container(
                    height: 51.h, width: 371.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(18.r),),
                      color: PrimaryGreen,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('End of 40 over(5 runs)',
                              style: semiBoldText(fontSize: 12.sp, color: BasicWhite),),
                            Text('177/2',
                              style: boldText(fontSize: 14.sp, color: BasicWhite),),
                          ],
                        ),
                        SizedBox(height: 2.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Bangladesh 177/2',
                              style: semiBoldText(fontSize: 12.sp, color: BasicWhite),),
                            Text('5 runs',
                              style: regularText(fontSize: 12.sp, color: BasicWhite),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 58.h, width: 371.w,
                    decoration: BoxDecoration(
                      color: PrimaryDeepGreen,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 16.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Sakib',
                                      style: semiBoldText(fontSize: 13.sp, color: BasicWhite),),
                                    Text('121(52)',
                                      style: semiBoldText(fontSize: 13.sp, color: BasicWhite),)
                                  ],
                                ),
                                SizedBox(height: 6.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Sakib',
                                      style: semiBoldText(fontSize: 13.sp, color: BasicWhite),),
                                    Text('121(52)',
                                      style: semiBoldText(fontSize: 13.sp, color: BasicWhite),)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(height: 58.h, width: 1.sp, color: PrimaryGreen,),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Rijbi',
                                      style: semiBoldText(fontSize: 13.sp, color: BasicWhite),),
                                    Text('10-1-38-2',
                                      style: semiBoldText(fontSize: 13.sp, color: BasicWhite),)
                                  ],
                                ),
                                SizedBox(height: 6.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Makmal',
                                      style: semiBoldText(fontSize: 13.sp, color: BasicWhite),),
                                    Text('9-1-39-1',
                                      style: semiBoldText(fontSize: 13.sp, color: BasicWhite),)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: 371.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(18.r),),
                      color: BasicWhite,
                      boxShadow: [
                        BoxShadow(
                          color: Grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: Column(
                      children: [
                        SizedBox(height: 17.h,),
                        Column(
                          children: List.generate(6, (index) => Padding(
                            padding: EdgeInsets.only(bottom: 8.w),
                            child: Row(
                              children: [
                                Text('33.${index+1}',
                                  style: semiBoldText(fontSize: 15.sp, color: Grey),),
                                SizedBox(width: 24.w,),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.r),
                                    color: Grey,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.w),
                                    child: Text('3',
                                      style: boldText(fontSize: 15.sp, color: BasicWhite),),
                                  ),
                                ),
                                SizedBox(width: 20.w,),
                                Text('Sakib al hasan , no run',
                                  style: semiBoldText(fontSize: 15.sp, color: Grey),),
                              ],
                            ),
                          ),),
                        ),
                        SizedBox(height: 23.h,),

                      ],
                    ),
                  ),
                ),*/
            ],
          );
        } else if (state is MatchDetailsLive) {
          return ListView.builder(
              itemCount: state.overWiseCommentary.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              reverse: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          height: 51.h,
                          width: 371.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(18.r),
                            ),
                            color: PrimaryGreen,
                          ),
                          padding: EdgeInsets.only(left: 28.w, right: 20.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${state.overWiseCommentary[index].commentary.split(',')[0]}',
                                    style: semiBoldText(
                                        fontSize: 12.sp, color: BasicWhite),
                                  ),
                                  Text(
                                    '${state.overWiseCommentary[index].commentary.split(' ').last}',
                                    style: boldText(
                                        fontSize: 14.sp, color: BasicWhite),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${state.overWiseCommentary[index].commentary.split(',')[1].substring(
                                      1,
                                    )}',
                                    style: semiBoldText(
                                        fontSize: 12.sp, color: BasicWhite),
                                  ),
                                  Text(
                                    '${state.overWiseCommentary[index].commentary.split(',')[0].split('(').last.split(')').first}',
                                    style: regularText(
                                        fontSize: 12.sp, color: BasicWhite),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 58.h,
                          width: 371.w,
                          decoration: BoxDecoration(
                            color: PrimaryDeepGreen,
                          ),
                          padding: EdgeInsets.only(left: 28.w, right: 20.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 16.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      state.overWiseCommentary[index].batsman!
                                          .length >
                                          0
                                          ? Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            '${state.overWiseCommentary[index].batsman![0].batsmanName.split(' ')[0]}',
                                            style: semiBoldText(
                                                fontSize: 13.sp,
                                                color: BasicWhite),
                                          ),
                                          Text(
                                            '${state.overWiseCommentary[index].batsman![0].runs}(${state.overWiseCommentary[index].batsman![0].ballFaced})',
                                            style: semiBoldText(
                                                fontSize: 13.sp,
                                                color: BasicWhite),
                                          ),
                                        ],
                                      )
                                          : Container(),
                                      SizedBox(
                                        height: 6.h,
                                      ),
                                      state.overWiseCommentary[index].batsman!
                                          .length >
                                          1
                                          ? Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            '${state.overWiseCommentary[index].batsman![1].batsmanName.split(' ')[0]}',
                                            style: semiBoldText(
                                                fontSize: 13.sp,
                                                color: BasicWhite),
                                          ),
                                          Text(
                                            '${state.overWiseCommentary[index].batsman![1].runs}(${state.overWiseCommentary[index].batsman![0].ballFaced})',
                                            style: semiBoldText(
                                                fontSize: 13.sp,
                                                color: BasicWhite),
                                          ),
                                        ],
                                      )
                                          : Container(),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 58.h,
                                width: 1.sp,
                                color: PrimaryGreen,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 16.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      state.overWiseCommentary[index].bowlers!
                                          .length >
                                          0
                                          ? Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            '${state.overWiseCommentary[index].bowlers![0].bowlerName.split(' ')[1]}',
                                            style: semiBoldText(
                                                fontSize: 13.sp,
                                                color: BasicWhite),
                                          ),
                                          Text(
                                            '${state.overWiseCommentary[index].bowlers![0].overs}-${state.overWiseCommentary[index].bowlers![0].maidens}-${state.overWiseCommentary[index].bowlers![0].runs}-${state.overWiseCommentary[index].bowlers![0].wickets}',
                                            style: semiBoldText(
                                                fontSize: 13.sp,
                                                color: BasicWhite),
                                          ),
                                        ],
                                      )
                                          : Container(),
                                      SizedBox(
                                        height: 6.h,
                                      ),
                                      state.overWiseCommentary[index].bowlers!
                                          .length >
                                          1
                                          ? Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            '${state.overWiseCommentary[index].bowlers![1].bowlerName.split(' ')[1]}',
                                            style: semiBoldText(
                                                fontSize: 13.sp,
                                                color: BasicWhite),
                                          ),
                                          Text(
                                            '${state.overWiseCommentary[index].bowlers![1].overs}-${state.overWiseCommentary[index].bowlers![1].maidens}-${state.overWiseCommentary[index].bowlers![1].runs}-${state.overWiseCommentary[index].bowlers![1].wickets}',
                                            style: semiBoldText(
                                                fontSize: 13.sp,
                                                color: BasicWhite),
                                          ),
                                        ],
                                      )
                                          : Container(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 371.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(18.r),
                            ),
                            color: BasicWhite,
                            boxShadow: [
                              BoxShadow(
                                color: Grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset:
                                Offset(0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(left: 28.w, right: 16.w),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 17.h,
                              ),
                              ListView.builder(
                                  itemCount: state.overWiseCommentary.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  reverse: true,
                                  itemBuilder: (context, i) {
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 8.w),
                                      child: Row(
                                        children: [
                                          Text(
                                            '${state.overWiseCommentary[index].oneOverCommentary[i].over}.${state.overWiseCommentary[index].oneOverCommentary[i].ball}',
                                            style: semiBoldText(
                                                fontSize: 15.sp, color: Grey),
                                          ),
                                          SizedBox(
                                            width: 24.w,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(16.r),
                                              color: _scoreColor(state
                                                  .overWiseCommentary[index]
                                                  .oneOverCommentary[i]
                                                  .score),
                                            ),
                                            child: SizedBox(
                                              height: 25.h,
                                              width: 47.w,
                                              child: Center(
                                                child: Text(
                                                  '${state.overWiseCommentary[index].oneOverCommentary[i].score}'
                                                      .toUpperCase(),
                                                  style: boldText(
                                                    fontSize: 14.sp,
                                                    color: BasicWhite,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          FittedBox(
                                            fit: BoxFit.fill,
                                            child: SizedBox(
                                              width: 206.w,
                                              child: Text(
                                                '${state.overWiseCommentary[index].oneOverCommentary[i].commentary}',
                                                maxLines: 2,
                                                style: semiBoldText(
                                                    fontSize: 11.sp,
                                                    color: Grey),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                              SizedBox(
                                height: 23.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        } else {
          return Container();
        }
      },
    );
  }

  _scoreboardSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _oneSideScoreboard(),
        _oneSideScoreboard(),
        Container(
          //height: 120,
          margin: EdgeInsets.symmetric(horizontal: 23.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color: Grey.withOpacity(.3),
            ),
            color: BasicWhite,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: Text(
                  "Match Info",
                  style: boldText(
                    fontSize: 15.sp,
                    color: PrimaryGreen,
                  ),
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Column(
                children: [
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 30.w, vertical: 4.h),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Match',
                            style: boldText(fontSize: 12.sp),
                          ),
                        ),
                        Text(
                          ':',
                          style: boldText(fontSize: 12.sp),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Text(
                              'Match',
                              style: regularText(fontSize: 12.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 30.w, vertical: 4.h),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Date',
                            style: boldText(fontSize: 12.sp),
                          ),
                        ),
                        Text(
                          ':',
                          style: boldText(fontSize: 12.sp),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Text(
                              'Match',
                              style: regularText(fontSize: 12.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 30.w, vertical: 4.h),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Time',
                            style: boldText(fontSize: 12.sp),
                          ),
                        ),
                        Text(
                          ':',
                          style: boldText(fontSize: 12.sp),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Text(
                              'Match',
                              style: regularText(fontSize: 12.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 30.w, vertical: 4.h),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Venue',
                            style: boldText(fontSize: 12.sp),
                          ),
                        ),
                        Text(
                          ':',
                          style: boldText(fontSize: 12.sp),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Text(
                              'Match',
                              style: regularText(fontSize: 12.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 30.w, vertical: 4.h),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Umpire',
                            style: boldText(fontSize: 12.sp),
                          ),
                        ),
                        Text(
                          ':',
                          style: boldText(fontSize: 12.sp),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Text(
                              'Match',
                              style: regularText(fontSize: 12.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 30.w, vertical: 4.h),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Third Umpire',
                            style: boldText(fontSize: 12.sp),
                          ),
                        ),
                        Text(
                          ':',
                          style: boldText(fontSize: 12.sp),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Text(
                              'Match',
                              style: regularText(fontSize: 12.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                height: .7,
                color: Grey,
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'France Women Squad:',
                      style: boldText(fontSize: 12.sp),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'TD Coleman ,Wayne Davis ,Albert Gopie ,Jamaine Morgan ,Errol Thomas ,Jamie Merchant ,O Walters ,K Santokie ,BA Buchanan ,Sherdon Allen ,Chevonie Grant ,AN Brown ,Zidane Gordon ,Romone Francis ,Brian Clarke ,Alex Johnson ,Tieno Osbourne ,Lorenzo McDonald ,Sherwayne Dixon ',
                      style: mediumText(
                        fontSize: 12.sp,
                        color: PrimaryGreen,
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Text(
                      'France Women Playing XI:',
                      style: boldText(fontSize: 12.sp),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'TD Coleman ,Wayne Davis ,Albert Gopie ,Jamaine Morgan ,Errol Thomas ,Jamie Merchant ,O Walters ,K Santokie ,BA Buchanan ,Sherdon Allen ,Chevonie Grant ,AN Brown ,Zidane Gordon ,Romone Francis ,Brian Clarke ,Alex Johnson ,Tieno Osbourne ,Lorenzo McDonald ,Sherwayne Dixon ',
                      style: mediumText(
                        fontSize: 12.sp,
                        color: PrimaryGreen,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                height: .7,
                color: Grey,
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'France Women Squad:',
                      style: boldText(fontSize: 12.sp),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'TD Coleman ,Wayne Davis ,Albert Gopie ,Jamaine Morgan ,Errol Thomas ,Jamie Merchant ,O Walters ,K Santokie ,BA Buchanan ,Sherdon Allen ,Chevonie Grant ,AN Brown ,Zidane Gordon ,Romone Francis ,Brian Clarke ,Alex Johnson ,Tieno Osbourne ,Lorenzo McDonald ,Sherwayne Dixon ',
                      style: mediumText(
                        fontSize: 12.sp,
                        color: PrimaryGreen,
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Text(
                      'France Women Playing XI:',
                      style: boldText(fontSize: 12.sp),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'TD Coleman ,Wayne Davis ,Albert Gopie ,Jamaine Morgan ,Errol Thomas ,Jamie Merchant ,O Walters ,K Santokie ,BA Buchanan ,Sherdon Allen ,Chevonie Grant ,AN Brown ,Zidane Gordon ,Romone Francis ,Brian Clarke ,Alex Johnson ,Tieno Osbourne ,Lorenzo McDonald ,Sherwayne Dixon ',
                      style: mediumText(
                        fontSize: 12.sp,
                        color: PrimaryGreen,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50.h,
        ),
      ],
    );

    /*BlocBuilder<MatchDetailsBloc, MatchDetailsState>(
      builder: (context, state){
        if(state is MatchDetailsLoading){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h,),
              Center(
                child: Container(
                  width: 371.w,
                  margin: EdgeInsets.only(bottom: 20.h,),
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
                    padding: EdgeInsets.fromLTRB(9.w, 23.h, 9.w, 22.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 8.w,),
                            RoundedSkeleton(height: 16, width: 140,),
                            Spacer(),
                            RoundedSkeleton(height: 16, width: 80,),
                            SizedBox(width: 8.w,),
                          ],
                        ),
                        SizedBox(height: 21.h,),
                        Row(
                          children: [
                            SizedBox(width: 8.w,),
                            RoundedSkeleton(height: 16, width: 80,),
                            Spacer(),
                            RoundedSkeleton(height: 16, width: 80,),
                            SizedBox(width: 7.w,),
                          ],
                        ),

                        SizedBox(height: 21.h,),
                        Row(
                          children: [
                            SizedBox(width: 8.w,),
                            RoundedSkeleton(height: 16, width: 240,),
                          ],
                        ),
                        SizedBox(height: 21.h,),
                        Row(
                          children: [
                            SizedBox(width: 8.h,),
                            RoundedSkeleton(height: 16, width: 140,),
                            SizedBox(width: 16.h,),
                            RoundedSkeleton(height: 16, width: 140,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              */ /*Container(
                  height: 35.h, width: 230,
                  margin: EdgeInsets.only(left: 23.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.r),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [PrimaryGreen,PrimaryDeepGreen]
                      )
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: Row(
                    children: List.generate(3, (index) => InkWell(
                      onTap: (){
                        setState(() {
                          selectedItem = tabItems[index];
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 15.w),
                        child: Text(tabItems[index],
                          style: selectedItem == tabItems[index] ? selectedStyle : unselectedStyle,),
                      ),
                    ),),
                  ),
                ),
                SizedBox(height: 16.h,),
                Center(
                  child: Container(
                    height: 51.h, width: 371.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(18.r),),
                      color: PrimaryGreen,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('End of 40 over(5 runs)',
                              style: semiBoldText(fontSize: 12.sp, color: BasicWhite),),
                            Text('177/2',
                              style: boldText(fontSize: 14.sp, color: BasicWhite),),
                          ],
                        ),
                        SizedBox(height: 2.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Bangladesh 177/2',
                              style: semiBoldText(fontSize: 12.sp, color: BasicWhite),),
                            Text('5 runs',
                              style: regularText(fontSize: 12.sp, color: BasicWhite),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 58.h, width: 371.w,
                    decoration: BoxDecoration(
                      color: PrimaryDeepGreen,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 16.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Sakib',
                                      style: semiBoldText(fontSize: 13.sp, color: BasicWhite),),
                                    Text('121(52)',
                                      style: semiBoldText(fontSize: 13.sp, color: BasicWhite),)
                                  ],
                                ),
                                SizedBox(height: 6.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Sakib',
                                      style: semiBoldText(fontSize: 13.sp, color: BasicWhite),),
                                    Text('121(52)',
                                      style: semiBoldText(fontSize: 13.sp, color: BasicWhite),)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(height: 58.h, width: 1.sp, color: PrimaryGreen,),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Rijbi',
                                      style: semiBoldText(fontSize: 13.sp, color: BasicWhite),),
                                    Text('10-1-38-2',
                                      style: semiBoldText(fontSize: 13.sp, color: BasicWhite),)
                                  ],
                                ),
                                SizedBox(height: 6.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Makmal',
                                      style: semiBoldText(fontSize: 13.sp, color: BasicWhite),),
                                    Text('9-1-39-1',
                                      style: semiBoldText(fontSize: 13.sp, color: BasicWhite),)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: 371.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(18.r),),
                      color: BasicWhite,
                      boxShadow: [
                        BoxShadow(
                          color: Grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: Column(
                      children: [
                        SizedBox(height: 17.h,),
                        Column(
                          children: List.generate(6, (index) => Padding(
                            padding: EdgeInsets.only(bottom: 8.w),
                            child: Row(
                              children: [
                                Text('33.${index+1}',
                                  style: semiBoldText(fontSize: 15.sp, color: Grey),),
                                SizedBox(width: 24.w,),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.r),
                                    color: Grey,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.w),
                                    child: Text('3',
                                      style: boldText(fontSize: 15.sp, color: BasicWhite),),
                                  ),
                                ),
                                SizedBox(width: 20.w,),
                                Text('Sakib al hasan , no run',
                                  style: semiBoldText(fontSize: 15.sp, color: Grey),),
                              ],
                            ),
                          ),),
                        ),
                        SizedBox(height: 23.h,),

                      ],
                    ),
                  ),
                ),*/ /*
            ],
          );
        }
        else if(state is MatchDetailsScoreboard){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _oneSideScoreboard(),
              _oneSideScoreboard(),
            ],
          );
        }
        else{
          return Container();
        }
      },
    );*/
  }

  _oneSideScoreboard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'Bangladesh'.toUpperCase(),
            style: boldText(fontSize: 13.sp),
          ),
        ),
        SizedBox(
          height: 18.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Row(
            children: [
              Container(
                height: 19.h,
                width: 167.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: PrimaryGreen),
                child: Padding(
                  padding: EdgeInsets.only(left: 15.sp, top: 4.h),
                  child: Text(
                    'Batsman'.toUpperCase(),
                    style: boldText(fontSize: 10.sp, color: BasicWhite),
                  ),
                ),
              ),
              SizedBox(
                width: 26.w,
              ),
              Container(
                height: 19.h,
                width: 28.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Grey.withOpacity(.4),
                ),
                child: Center(
                  child: Text(
                    'R',
                    style: boldText(fontSize: 10.sp),
                  ),
                ),
              ),
              Spacer(),
              Container(
                height: 19.h,
                width: 28.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Grey.withOpacity(.4),
                ),
                child: Center(
                  child: Text(
                    'B',
                    style: boldText(fontSize: 10.sp),
                  ),
                ),
              ),
              Spacer(),
              Container(
                height: 19.h,
                width: 28.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Grey.withOpacity(.4),
                ),
                child: Center(
                  child: Text(
                    '4s',
                    style: boldText(fontSize: 10.sp),
                  ),
                ),
              ),
              Spacer(),
              Container(
                height: 19.h,
                width: 28.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Grey.withOpacity(.4),
                ),
                child: Center(
                  child: Text(
                    '6s',
                    style: boldText(fontSize: 10.sp),
                  ),
                ),
              ),
              Spacer(),
              Container(
                height: 19.h,
                width: 28.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Grey.withOpacity(.4),
                ),
                child: Center(
                  child: Text(
                    'SR',
                    style: boldText(fontSize: 10.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        ListView.builder(
            itemCount: 5,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            reverse: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 22.w, right: 22.w, bottom: 4.h),
                child: Row(
                  children: [
                    Container(
                      height: 37.h,
                      width: 170.w,
                      padding: EdgeInsets.only(left: 15.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19.r),
                        border: Border.all(
                          color: Grey.withOpacity(.1),
                        ),
                        color: BasicWhite,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sakib Al Hasan',
                            style: boldText(
                                fontSize: 12.sp, color: PrimaryDeepGreen),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            'c James Weighell b A Salter',
                            style: semiBoldText(
                              fontSize: 8.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 28.w,
                    ),
                    Center(
                      child: Text(
                        '105',
                        style: semiBoldText(fontSize: 10.sp),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        '77',
                        style: semiBoldText(fontSize: 10.sp),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        '6',
                        style: semiBoldText(fontSize: 10.sp),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        '4',
                        style: semiBoldText(fontSize: 10.sp),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        '105',
                        style: semiBoldText(fontSize: 10.sp),
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    )
                  ],
                ),
              );
            }),
        SizedBox(
          height: 18.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Row(
            children: [
              Container(
                height: 19.h,
                width: 69.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: PrimaryGreen),
                child: Center(
                  child: Text(
                    'Extras'.toUpperCase(),
                    style: semiBoldText(fontSize: 10.sp, color: BasicWhite),
                  ),
                ),
              ),
              SizedBox(
                width: 18.w,
              ),
              Text(
                '8',
                style: semiBoldText(fontSize: 10.sp),
              ),
              SizedBox(
                width: 18.w,
              ),
              Text(
                '8, 4lb, 2b, 2,lb',
                style: semiBoldText(fontSize: 10.sp),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Row(
            children: [
              Container(
                height: 19.h,
                width: 69.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: PrimaryGreen),
                child: Center(
                  child: Text(
                    'Total'.toUpperCase(),
                    style: semiBoldText(fontSize: 10.sp, color: BasicWhite),
                  ),
                ),
              ),
              SizedBox(
                width: 18.w,
              ),
              Text(
                '312/3 (50)',
                style: semiBoldText(fontSize: 10.sp),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Row(
            children: [
              Container(
                height: 19.h,
                width: 69.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: PrimaryGreen),
                child: Center(
                  child: Text(
                    "Didn't bat".toUpperCase(),
                    style: semiBoldText(fontSize: 10.sp, color: BasicWhite),
                  ),
                ),
              ),
              SizedBox(
                width: 18.w,
              ),
              Text(
                '-----',
                style: semiBoldText(fontSize: 10.sp),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 26.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Row(
            children: [
              Container(
                height: 19.h,
                width: 167.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: PrimaryGreen),
                child: Padding(
                  padding: EdgeInsets.only(left: 15.sp, top: 4.h),
                  child: Text(
                    'Bowlers'.toUpperCase(),
                    style: boldText(fontSize: 10.sp, color: BasicWhite),
                  ),
                ),
              ),
              SizedBox(
                width: 26.w,
              ),
              Container(
                height: 19.h,
                width: 28.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Grey.withOpacity(.4)),
                child: Center(
                  child: Text(
                    'O',
                    style: boldText(fontSize: 10.sp),
                  ),
                ),
              ),
              Spacer(),
              Container(
                height: 19.h,
                width: 28.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Grey.withOpacity(.4)),
                child: Center(
                  child: Text(
                    'M',
                    style: boldText(fontSize: 10.sp),
                  ),
                ),
              ),
              Spacer(),
              Container(
                height: 19.h,
                width: 28.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Grey.withOpacity(.4)),
                child: Center(
                  child: Text(
                    'R',
                    style: boldText(fontSize: 10.sp),
                  ),
                ),
              ),
              Spacer(),
              Container(
                height: 19.h,
                width: 28.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Grey.withOpacity(.4)),
                child: Center(
                  child: Text(
                    'W',
                    style: boldText(fontSize: 10.sp),
                  ),
                ),
              ),
              Spacer(),
              Container(
                height: 19.h,
                width: 28.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Grey.withOpacity(.4)),
                child: Center(
                  child: Text(
                    'ER',
                    style: boldText(fontSize: 10.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        ListView.builder(
            itemCount: 5,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            reverse: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 22.w, right: 22.w, bottom: 4.h),
                child: Row(
                  children: [
                    Container(
                      height: 26.h,
                      width: 170.w,
                      padding: EdgeInsets.only(left: 15.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19.r),
                        border: Border.all(
                          color: Grey.withOpacity(.1),
                        ),
                        color: BasicWhite,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 6.h),
                        child: Text(
                          'Sakib Al Hasan',
                          style: boldText(
                              fontSize: 12.sp, color: PrimaryDeepGreen),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 28.w,
                    ),
                    Center(
                      child: Text(
                        '105',
                        style: semiBoldText(fontSize: 10.sp),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        '77',
                        style: semiBoldText(fontSize: 10.sp),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        '6',
                        style: semiBoldText(fontSize: 10.sp),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        '4',
                        style: semiBoldText(fontSize: 10.sp),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        '105',
                        style: semiBoldText(fontSize: 10.sp),
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    )
                  ],
                ),
              );
            }),
        SizedBox(
          height: 26.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Row(
            children: [
              Container(
                height: 19.h,
                width: 167.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: PrimaryGreen),
                child: Padding(
                  padding: EdgeInsets.only(left: 15.sp, top: 4.h),
                  child: Text(
                    'W Falls'.toUpperCase(),
                    style: boldText(fontSize: 10.sp, color: BasicWhite),
                  ),
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Container(
                height: 19.h,
                width: 48.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Grey.withOpacity(.4)),
                child: Center(
                  child: Text(
                    'Score'.toUpperCase(),
                    style: boldText(fontSize: 10.sp),
                  ),
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Container(
                height: 19.h,
                width: 48.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Grey.withOpacity(.4)),
                child: Center(
                  child: Text(
                    'Over'.toUpperCase(),
                    style: boldText(fontSize: 10.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        ListView.builder(
          itemCount: 5,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          reverse: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: 22.w, right: 22.w, bottom: 4.h),
              child: Row(
                children: [
                  Container(
                    height: 26.h,
                    width: 170.w,
                    padding: EdgeInsets.only(left: 15.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19.r),
                      border: Border.all(
                        color: Grey.withOpacity(.1),
                      ),
                      color: BasicWhite,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 6.h),
                      child: Text(
                        'Sakib Al Hasan',
                        style:
                        boldText(fontSize: 12.sp, color: PrimaryDeepGreen),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 22.w,
                  ),
                  Center(
                    child: Text(
                      '15-2',
                      style: semiBoldText(fontSize: 10.sp),
                    ),
                  ),
                  SizedBox(
                    width: 42.w,
                  ),
                  Center(
                    child: Text(
                      '8.2',
                      style: semiBoldText(fontSize: 10.sp),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(
          height: 26.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Row(
            children: [
              Container(
                height: 19.h,
                width: 72.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Grey.withOpacity(.5),
                ),
                child: Center(
                  child: Text(
                    "Powerplay".toUpperCase(),
                    style: semiBoldText(
                      fontSize: 10.sp,
                      color: BasicWhite,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Container(
                height: 19.h,
                width: 60.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: PrimaryGreen),
                child: Center(
                  child: Text(
                    "over".toUpperCase(),
                    style: semiBoldText(fontSize: 10.sp, color: BasicWhite),
                  ),
                ),
              ),
              SizedBox(
                width: 13.w,
              ),
              Container(
                height: 19.h,
                width: 60.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: PrimaryGreen),
                child: Center(
                  child: Text(
                    "runs".toUpperCase(),
                    style: semiBoldText(fontSize: 10.sp, color: BasicWhite),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Row(
            children: [
              Container(
                height: 19.h,
                width: 72.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Grey.withOpacity(.5),
                ),
                child: Center(
                  child: Text(
                    "mandatory".toUpperCase(),
                    style: semiBoldText(
                      fontSize: 10.sp,
                      color: BasicWhite,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 24.w,
              ),
              Center(
                child: Text(
                  "0.1-6.0".toUpperCase(),
                  style: semiBoldText(
                    fontSize: 10.sp,
                  ),
                ),
              ),
              SizedBox(
                width: 44.w,
              ),
              Center(
                child: Text(
                  "206".toUpperCase(),
                  style: semiBoldText(
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50.h,
        ),
      ],
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
                      colors: [PrimaryGreen, PrimaryDeepGreen])),
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
            SizedBox(
              height: 16.h,
            ),
            selectChild(
              selectedItem,
            ),
          ],
        ),
      ),
    );
  }

}
