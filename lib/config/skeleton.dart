import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color_constants.dart';

class RoundedSkeleton extends StatelessWidget {
  final double height, width;
  const RoundedSkeleton({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: BasicWhite,
        ),
      ),
    );
  }
}
