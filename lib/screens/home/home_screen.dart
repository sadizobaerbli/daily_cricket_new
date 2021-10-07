import 'package:dailycricket_nv/config/color_constants.dart';
import 'package:dailycricket_nv/screens/home/home_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scroll_to_index/scroll_to_index.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isSwitched = false;
  bool isExpanded = true;
  List<int> item = [1,2,4,6];
  AutoScrollController? _autoScrollController;
  final scrollDirection = Axis.vertical;

  bool get _isAppBarExpanded {
    return _autoScrollController!.hasClients &&
        _autoScrollController!.offset > (110 - kToolbarHeight);
  }

  @override
  void dispose() {
    _autoScrollController!.dispose();
    super.dispose();
  }

  @override
  void initState() {

    _autoScrollController = AutoScrollController(
      axis: scrollDirection,
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
    )..addListener(() =>
        _isAppBarExpanded
            ? isExpanded != false
            ? setState(() {isExpanded = false;},
        ) : {} : isExpanded != true ? setState(() {isExpanded = true;}) : {},
      );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BasicWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(89.h),
        child: Stack(
          children: [
            Container(
              height: 89.h, width: 414.w,
              child: ClipRRect(
                borderRadius: !isExpanded ? BorderRadius.horizontal(left: Radius.circular(12.r), right: Radius.circular(15.r),) : BorderRadius.circular(0.r),
                child: Image.asset('asset/image_asset/background_1.png',
                  fit: BoxFit.fill,),
              ),
            ),
            Positioned(
              top: 44.h,
              child: Container(
                height: 26.h, width: 414.w,
                child: Row(
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
                          size: 15.sp,color: Color(0xff000000),),
                      ),
                    ),
                    Spacer(flex: 2,),
                    Container(
                      height: 28.h, width: 110.w,
                      child: Image.asset('asset/image_asset/logo.png'),),
                    Spacer(flex: 1,),
                    ImageIcon(AssetImage('asset/icon_asset/search.png'),
                      size: 20.sp,color: BasicWhite,),

                    SizedBox(width: 26.w,),
                    Stack(
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              isSwitched = !isSwitched;
                            });
                          },
                          child: Container(
                            height: 20.h, width: 36.w,
                            decoration: BoxDecoration(
                              color: BasicWhite,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                          ),
                        ),
                        isSwitched ? Positioned(
                          left: 0,
                          child: Container(
                            height: 20.h, width: 20.w,
                            decoration: BoxDecoration(
                              color: PrimaryGreen,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: Center(
                              child: Text('BN',
                              style: TextStyle(fontSize: 7, fontWeight: FontWeight.w800, color: Colors.white),),
                            )
                          ),
                        ) :
                        Positioned(
                          right: 0,
                          child: Container(
                            height: 20.h, width: 20.w,
                            decoration: BoxDecoration(
                              color: PrimaryDeepRed,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: Center(
                              child: Text('EN',
                              style: TextStyle(fontSize: 7, fontWeight: FontWeight.w800, color: Colors.white),),
                            )
                          ),
                        ),

                      ],
                    ),
                    SizedBox(width: 26.w,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView(
          controller: _autoScrollController,
          children: [

            Stack(
              children: [
                Container(
                  height: 92.h, width: 414.w,
                  child: Image.asset('asset/image_asset/background_2.png',
                    fit: BoxFit.fill,),
                ),
                Positioned(
                  child: HomeSlider(),),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
