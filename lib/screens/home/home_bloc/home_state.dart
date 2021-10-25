
import 'package:flutter/cupertino.dart';
import 'package:dailycricket_nv/screens/home/data_models/live_matches_data_model.dart';

@immutable
abstract class HomeState {
  const HomeState();

  @override
  // ignore: override_on_non_overriding_member
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

//------------------sucess state-----------------

class HomeSuccess extends HomeState {

  final LiveMatchesDataModel liveMatchesDataModel;
  HomeSuccess({required this.liveMatchesDataModel});

  @override
  List<Object> get props => [liveMatchesDataModel];
}

//------------------failure state-----------------

class HomeFailure extends HomeState {
  final String errorMessage;
  const HomeFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
