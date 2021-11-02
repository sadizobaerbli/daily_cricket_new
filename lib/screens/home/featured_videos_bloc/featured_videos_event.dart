import 'package:flutter/cupertino.dart';

@immutable
abstract class FeaturedVideosEvent {
  FeaturedVideosEvent();

  List<Object> get props => [];
}

//----------------data event with current index------------

class FeaturedVideoEvent extends FeaturedVideosEvent {

  @override
  List<Object> get props => [];
}
