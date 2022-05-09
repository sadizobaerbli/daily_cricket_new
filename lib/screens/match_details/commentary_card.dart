import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/color_constants.dart';
import '../../config/text_style.dart';
import '../../models/over_wise_commentary.dart';

class CommentaryCard extends StatelessWidget {
  final OverWiseCommentary overWiseCommentary;
  const CommentaryCard({Key? key, required this.overWiseCommentary})
      : super(key: key);

  Color _scoreColor(dynamic score) {
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

  @override
  Widget build(BuildContext context) {
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${overWiseCommentary.commentary.split(',')[0]}',
                        style: semiBoldText(
                          fontSize: 12.sp,
                          color: BasicWhite,
                        ),
                      ),
                      Text(
                        '${overWiseCommentary.commentary.split(' ').last}',
                        style: boldText(
                          fontSize: 14.sp,
                          color: BasicWhite,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${overWiseCommentary.
                        commentary.split(',')[1].substring(1,)}',
                        style: semiBoldText(
                          fontSize: 12.sp,
                          color: BasicWhite,
                        ),
                      ),
                      Text(
                        '${overWiseCommentary.commentary.
                        split(',')[0].split('(').last.split(')').first}',
                        style: regularText(
                          fontSize: 12.sp,
                          color: BasicWhite,
                        ),
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
                          overWiseCommentary.batsman!.length > 0
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${overWiseCommentary.batsman![0].
                                      batsmanName.split(' ')[0]}',
                                      style: semiBoldText(
                                        fontSize: 13.sp,
                                        color: BasicWhite,
                                      ),
                                    ),
                                    Text(
                                      '${overWiseCommentary.batsman![0].runs}(${overWiseCommentary.batsman![0].ballFaced})',
                                      style: semiBoldText(
                                        fontSize: 13.sp,
                                        color: BasicWhite,
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
                          SizedBox(height: 6.h),
                          overWiseCommentary.batsman!.length > 1
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${overWiseCommentary.batsman![1].batsmanName.split(' ')[0]}',
                                      style: semiBoldText(
                                        fontSize: 13.sp,
                                        color: BasicWhite,
                                      ),
                                    ),
                                    Text(
                                      '${overWiseCommentary.batsman![1].runs}(${overWiseCommentary.batsman![0].ballFaced})',
                                      style: semiBoldText(
                                        fontSize: 13.sp,
                                        color: BasicWhite,
                                      ),
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
                          overWiseCommentary.bowlers!.length > 0
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${overWiseCommentary.bowlers![0].bowlerName.split(' ')[1]}',
                                      style: semiBoldText(
                                        fontSize: 13.sp,
                                        color: BasicWhite,
                                      ),
                                    ),
                                    Text(
                                      '${overWiseCommentary.bowlers![0].overs}-${overWiseCommentary.bowlers![0].maidens}-${overWiseCommentary.bowlers![0].runs}-${overWiseCommentary.bowlers![0].wickets}',
                                      style: semiBoldText(
                                        fontSize: 13.sp,
                                        color: BasicWhite,
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
                          SizedBox(height: 6.h),
                          overWiseCommentary.bowlers!.length > 1
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${overWiseCommentary.bowlers![1].bowlerName.split(' ')[1]}',
                                      style: semiBoldText(
                                        fontSize: 13.sp,
                                        color: BasicWhite,
                                      ),
                                    ),
                                    Text(
                                      '${overWiseCommentary.bowlers![1].overs}-${overWiseCommentary.bowlers![1].maidens}-${overWiseCommentary.bowlers![1].runs}-${overWiseCommentary.bowlers![1].wickets}',
                                      style: semiBoldText(
                                        fontSize: 13.sp,
                                        color: BasicWhite,
                                      ),
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
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              padding: EdgeInsets.only(left: 28.w, right: 16.w),
              child: Column(
                children: [
                  SizedBox(height: 17.h),
                  ListView.builder(
                    itemCount: overWiseCommentary.oneOverCommentary.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    reverse: true,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.w),
                        child: Row(
                          children: [
                            Text(
                              '${overWiseCommentary.oneOverCommentary[i].over}.${overWiseCommentary.oneOverCommentary[i].ball}',
                              style: semiBoldText(
                                fontSize: 15.sp,
                                color: Grey,
                              ),
                            ),
                            SizedBox(width: 24.w),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: _scoreColor(overWiseCommentary
                                    .oneOverCommentary[i].score),
                              ),
                              child: SizedBox(
                                height: 25.h,
                                width: 47.w,
                                child: Center(
                                  child: Text(
                                    '${overWiseCommentary.oneOverCommentary[i].score}'
                                        .toUpperCase(),
                                    style: boldText(
                                      fontSize: 14.sp,
                                      color: BasicWhite,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20.w),
                            FittedBox(
                              fit: BoxFit.fill,
                              child: SizedBox(
                                width: 206.w,
                                child: Text(
                                  '${overWiseCommentary.oneOverCommentary[i].commentary}',
                                  maxLines: 2,
                                  style: semiBoldText(
                                    fontSize: 11.sp,
                                    color: Grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 23.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
