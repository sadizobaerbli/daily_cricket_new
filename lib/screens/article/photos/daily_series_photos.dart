import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DailySeriesPhotos extends StatefulWidget {
  const DailySeriesPhotos({Key? key}) : super(key: key);

  @override
  _DailySeriesPhotosState createState() => _DailySeriesPhotosState();
}

class _DailySeriesPhotosState extends State<DailySeriesPhotos> {

  List<Widget> _listTile = <Widget>[
    BackGroundTile(image: 'asset/image_asset/pic_1.jpg',),
    BackGroundTile(image: 'asset/image_asset/pic_2.jpg',),
    BackGroundTile(image: 'asset/image_asset/picture.png',),
    BackGroundTile(image: 'asset/image_asset/picture_2.png',),
    BackGroundTile(image: 'asset/image_asset/pic_1.jpg',),
    BackGroundTile(image: 'asset/image_asset/pic_2.jpg',),
    BackGroundTile(image: 'asset/image_asset/picture_2.png',),
    BackGroundTile(image: 'asset/image_asset/pic_2.jpg',),
    BackGroundTile(image: 'asset/image_asset/picture.png',),
    BackGroundTile(image: 'asset/image_asset/picture_2.png',),

  ];

  List<StaggeredTile>  _cardTile = <StaggeredTile> [
    StaggeredTile.count(6, 4),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(4, 4),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 2),
  ];

  _mainCard(){
    return Container(
      height: MediaQuery.of(context).size.height - 180.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: StaggeredGridView.count(
        crossAxisCount: 6,
        staggeredTiles: _cardTile,
        children: _listTile,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,

      ),
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
