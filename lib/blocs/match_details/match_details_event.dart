import 'package:flutter/cupertino.dart';

@immutable
abstract class MatchDetailsEvent {
  MatchDetailsEvent();

  List<Object> get props => [];
}

//----------------data event with current index------------

class MatchDetailsLiveEvent extends MatchDetailsEvent {

  final int matchId;
  MatchDetailsLiveEvent({required this.matchId});

  @override
  List<Object> get props => [matchId];
}

class MatchDetailsScoreboardEvent extends MatchDetailsEvent {

  final int matchId;
  MatchDetailsScoreboardEvent({required this.matchId});
  @override
  List<Object> get props => [];
}

class MatchDetailsCommentaryEvent extends MatchDetailsEvent {

  final int matchId;
  MatchDetailsCommentaryEvent({required this.matchId});

  @override
  List<Object> get props => [matchId];
}
