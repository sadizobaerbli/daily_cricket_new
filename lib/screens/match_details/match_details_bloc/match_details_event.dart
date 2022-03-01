import 'package:flutter/cupertino.dart';

@immutable
abstract class MatchDetailsEvent {
  MatchDetailsEvent();

  List<Object> get props => [];
}

//----------------data event with current index------------

class MatchDetailsDataEvent extends MatchDetailsEvent {

  final int matchId;
  MatchDetailsDataEvent({required this.matchId});

  @override
  List<Object> get props => [matchId];
}
