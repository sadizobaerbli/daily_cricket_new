import 'package:flutter/cupertino.dart';

@immutable
abstract class HomeEvent {
  HomeEvent();

  List<Object> get props => [];
}

//----------------data event with current index------------

class LiveMatchesEvent extends HomeEvent {

  @override
  List<Object> get props => [];
}
