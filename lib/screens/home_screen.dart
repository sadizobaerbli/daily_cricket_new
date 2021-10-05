import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.grey,
          pinned: true,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: Container(),
          ),
          expandedHeight: 200,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: Container(),
          ),
        ),
        SliverList(delegate: SliverChildListDelegate(
          [
            ListView.builder(
                itemCount: 7,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, i){

              return Container();
            })
          ]
        ),),
      ],
    );
  }
}
