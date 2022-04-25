import '../../config/color_constants.dart';
import '../../config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreOptions extends StatelessWidget {
  const MoreOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///This section indicates the information of items
    _item(String iconUrl, String title) {
      return Padding(
        padding: EdgeInsets.only(bottom: 17.h),
        child: Row(
          children: [
            SizedBox(width: 20.w),
            ImageIcon(
              AssetImage(iconUrl),
              size: 30.sp,
            ),
            SizedBox(width: 20.w),
            Text(
              title,
              style: boldText(
                fontSize: 14.sp,
                color: Grey,
              ),
            ),
          ],
        ),
      );
    }

    ///This section indicates the bottom selected icon
    _moreSelected() {
      return GestureDetector(
        onTap: () => Navigator.pop(context),
        child: ImageIcon(
          AssetImage('asset/icon_asset/more_selected.png'),
          size: 50.sp,
          color: BasicWhite,
        ),
      );
    }

    ///This section indicates the main dialog part and contains
    ///+ item
    _dialog() {
      return Container(
        width: 231.w,
        decoration: BoxDecoration(
          color: BasicWhite,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Column(
          children: [
            SizedBox(height: 50.h),
            _item('asset/icon_asset/browse_series.png', 'Browse Series'),
            _item('asset/icon_asset/browse_team.png', 'Browse Team'),
            _item('asset/icon_asset/trophy.png', 'Match Results'),
            _item('asset/icon_asset/comment.png', 'Commentary'),
            SizedBox(height: 33.h),
          ],
        ),
      );
    }

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Container(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
            ),
            Positioned(
              bottom: 150.h,
              right: 0.w,
              child: _dialog(),
            ),
            Positioned(
              bottom: 8.h,
              right: 20.w,
              child: _moreSelected(),
            ),
          ],
        ),
      ),
    );
  }
}
