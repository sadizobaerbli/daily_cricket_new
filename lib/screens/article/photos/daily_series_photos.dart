import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DailySeriesPhotos extends StatefulWidget {
  const DailySeriesPhotos({Key? key}) : super(key: key);

  @override
  _DailySeriesPhotosState createState() => _DailySeriesPhotosState();
}

class _DailySeriesPhotosState extends State<DailySeriesPhotos> {

  List<String> _images = [
    'asset/image_asset/pic_1.jpg',
    'asset/image_asset/pic_2.jpg',
    'asset/image_asset/picture.png',
    'asset/image_asset/picture_2.png',
    'asset/image_asset/pic_1.jpg',
    'asset/image_asset/pic_2.jpg',
    'asset/image_asset/picture_2.png',
    'asset/image_asset/pic_2.jpg',
    'asset/image_asset/picture.png',
    'asset/image_asset/picture_2.png',
  ];

  _mainCard(){
    return Container(
      height: MediaQuery.of(context).size.height - 180.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) =>
        new Container(
          child: new Container(
            child: Image.asset(_images[index], fit: BoxFit.fill,),
          ),
        ),
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(2, index.isEven ? 2 : 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      )
    );
  }



  @override
  Widget build(BuildContext context) {
    return _mainCard();
  }
}

class BackGroundTile extends StatelessWidget {
  final String image;

  BackGroundTile({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(image, fit: BoxFit.fill,),
    );
  }
}
