import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/color_constants.dart';
import '../../config/text_style.dart';
import '../../models/scoreboard_model.dart';

///This class refers every single scoreboard part
class OneSideScoreboard extends StatelessWidget {
  final Inning inning;
  const OneSideScoreboard({Key? key, required this.inning}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            inning.name!.toUpperCase(),
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
                  color: PrimaryGreen,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15.sp, top: 4.h),
                  child: Text(
                    'Batsman'.toUpperCase(),
                    style: boldText(fontSize: 10.sp, color: BasicWhite),
                  ),
                ),
              ),
              SizedBox(width: 26.w),
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
        SizedBox(height: 6.h),
        ListView.builder(
            itemCount: inning.batsmen!.length,
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
                            inning.batsmen![index].name!,
                            style: boldText(
                                fontSize: 12.sp, color: PrimaryDeepGreen),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            inning.batsmen![index].howOut!,
                            style: semiBoldText(
                              fontSize: 8.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 28.w),
                    Center(
                      child: Text(
                        inning.batsmen![index].runs!,
                        style: semiBoldText(fontSize: 10.sp),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        inning.batsmen![index].ballsFaced!,
                        style: semiBoldText(fontSize: 10.sp),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        inning.batsmen![index].fours!,
                        style: semiBoldText(fontSize: 10.sp),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        inning.batsmen![index].sixes!,
                        style: semiBoldText(fontSize: 10.sp),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        inning.batsmen![index].strikeRate!,
                        style: semiBoldText(fontSize: 10.sp),
                      ),
                    ),
                    SizedBox(width: 4.w)
                  ],
                ),
              );
            }),
        SizedBox(height: 18.h),
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
              SizedBox(width: 18.w),
              Text(
                inning.extraRuns!.total.toString(),
                style: semiBoldText(fontSize: 10.sp),
              ),
              SizedBox(width: 18.w),
              Text(
                '${inning.extraRuns!.byes}b, ${inning.extraRuns!.legbyes}lb, ${inning.extraRuns!.wides}w, ${inning.extraRuns!.noballs}nb',
                style: semiBoldText(fontSize: 10.sp),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
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
              SizedBox(width: 18.w),
              Text(
                inning.scoresFull.toString(),
                style: semiBoldText(fontSize: 10.sp),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
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
              SizedBox(width: 18.w),
              SizedBox(
                width: 200,
                child: Wrap(
                  direction: Axis.vertical,
                  spacing: 4.w,
                  children: List.generate(
                    inning.didNotBat!.length,
                        (index) => Text(
                          inning.didNotBat![index].name! + ',',
                          style: semiBoldText(fontSize: 10.sp),
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 26.h),
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
              SizedBox(width: 26.w),
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
        SizedBox(height: 6.h),
        ListView.builder(
            itemCount: inning.bowlers!.length,
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
                          inning.bowlers![index].name!,
                          style: boldText(
                              fontSize: 12.sp, color: PrimaryDeepGreen),
                        ),
                      ),
                    ),
                    SizedBox(width: 28.w),
                    Center(
                      child: Text(
                        inning.bowlers![index].overs!,
                        style: semiBoldText(fontSize: 10.sp),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        inning.bowlers![index].maidens!,
                        style: semiBoldText(fontSize: 10.sp),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        inning.bowlers![index].runsConceded!,
                        style: semiBoldText(fontSize: 10.sp),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        inning.bowlers![index].wickets!,
                        style: semiBoldText(fontSize: 10.sp),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        inning.bowlers![index].econ!,
                        style: semiBoldText(fontSize: 10.sp),
                      ),
                    ),
                    SizedBox(width: 4.w)
                  ],
                ),
              );
            }),
        SizedBox(height: 26.h),
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
              SizedBox(width: 12.w),
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
              SizedBox(width: 12.w),
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
        SizedBox(height: 6.h),
        ListView.builder(
          itemCount: inning.fows!.length,
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
                        inning.fows![index].name!,
                        style: boldText(
                          fontSize: 12.sp,
                          color: PrimaryDeepGreen,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 22.w),
                  Center(
                    child: Text(
                      '${inning.fows![index].scoreAtDismissal}-${inning.fows![index].number}',
                      style: semiBoldText(fontSize: 10.sp),
                    ),
                  ),
                  SizedBox(width: 42.w),
                  Center(
                    child: Text(
                      inning.fows![index].oversAtDismissal!,
                      style: semiBoldText(fontSize: 10.sp),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(height: 26.h),
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
              SizedBox(width: 12.w),
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
              SizedBox(width: 13.w),
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
        SizedBox(height: 6.h),
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
              SizedBox(width: 24.w),
              Center(
                child: Text(
                  "null".toUpperCase(),
                  style: semiBoldText(
                    fontSize: 10.sp,
                  ),
                ),
              ),
              SizedBox(width: 44.w),
              Center(
                child: Text(
                  "null".toUpperCase(),
                  style: semiBoldText(
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 50.h),
      ],
    );
  }
}
