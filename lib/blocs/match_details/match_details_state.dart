import 'package:dailycricket_nv/models/over_wise_commentary.dart';
import 'package:dailycricket_nv/models/scoreboard_model.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class MatchDetailsState {
  const MatchDetailsState();

  @override
  // ignore: override_on_non_overriding_member
  List<Object> get props => [];
}

class MatchDetailsInitial extends MatchDetailsState {}

class MatchDetailsLoading extends MatchDetailsState {
  @override
  List<Object> get props => [];
}

//------------------sucess state-----------------

class MatchDetailsLive extends MatchDetailsState {

  final List<OverWiseCommentary> overWiseCommentary;
  final String runRate;

  MatchDetailsLive({required this.overWiseCommentary, required this.runRate});

  @override
  List<Object> get props => [];
}

class MatchDetailsScoreboard extends MatchDetailsState {

  final MatchDetailsScoreboardModel matchDetailsScoreboardModel;

  MatchDetailsScoreboard({required this.matchDetailsScoreboardModel});

  @override
  List<Object> get props => [matchDetailsScoreboardModel];
}

class MatchDetailsCommentary extends MatchDetailsState {

  final List<OverWiseCommentary> overWiseCommentary;

  MatchDetailsCommentary({required this.overWiseCommentary});

  @override
  List<Object> get props => [overWiseCommentary];
}

//------------------failure state-----------------

class MatchDetailsFailure extends MatchDetailsState {
  final String errorMessage;
  const MatchDetailsFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
