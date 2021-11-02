
import 'package:dailycricket_nv/screens/home/data_models/featured_videos_model.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class FeaturedVideosState {
  const FeaturedVideosState();

  @override
  // ignore: override_on_non_overriding_member
  List<Object> get props => [];
}

class FeaturedVideosInitial extends FeaturedVideosState {}

class FeaturedVideosLoading extends FeaturedVideosState {
  @override
  List<Object> get props => [];
}

//------------------sucess state-----------------

class FeaturedVideosSuccess extends FeaturedVideosState {

  final FeaturedVideosModel featuredVideosModel;
  FeaturedVideosSuccess({required this.featuredVideosModel});

  @override
  List<Object> get props => [featuredVideosModel];
}

//------------------failure state-----------------

class FeaturedVideosFailure extends FeaturedVideosState {
  final String errorMessage;
  const FeaturedVideosFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
