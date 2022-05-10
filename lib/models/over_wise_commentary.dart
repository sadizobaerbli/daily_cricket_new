import 'match_details_live_model.dart';

class OverWiseCommentary {
  List<Commentary> oneOverCommentary = [];
  List<BowlersDetails>? bowlers = [];
  List<BatsmanDetails>? batsman = [];
  String commentary;

  OverWiseCommentary(
      {this.bowlers,
      this.batsman,
      required this.oneOverCommentary,
      required this.commentary});
}

class BowlersDetails {
  String bowlerName;
  int runs;
  int wickets;
  int maidens;
  dynamic overs;

  BowlersDetails(
      {required this.runs,
      required this.bowlerName,
      required this.maidens,
      required this.overs,
      required this.wickets});
}

class BatsmanDetails {
  String batsmanName;
  int runs;
  int ballFaced;

  BatsmanDetails(
      {required this.runs, required this.ballFaced, required this.batsmanName});
}
