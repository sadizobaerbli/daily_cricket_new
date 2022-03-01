import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomAppbar extends StatefulWidget {
  final double radius;
  const CustomAppbar({Key? key, this.radius = 0}) : super(key: key);

  @override
  _CustomAppbarState createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {

  bool isSwitched = false;

  _customAppbar(){
    return Stack(

      children: [

        ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(widget.radius.r),),
          child: Container(
            height: 89.h, width: 414.w,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return _customAppbar();
  }
}
