// To parse this JSON data, do
//
//     final matchDetailsLiveModel = matchDetailsLiveModelFromJson(jsonString);

import 'dart:convert';

MatchDetailsLiveModel matchDetailsLiveModelFromJson(String str) =>
    MatchDetailsLiveModel.fromJson(json.decode(str));

String matchDetailsLiveModelToJson(MatchDetailsLiveModel data) =>
    json.encode(data.toJson());

class MatchDetailsLiveModel {
  MatchDetailsLiveModel({
    this.status,
    this.response,
    this.etag,
    this.modified,
    this.datetime,
    this.apiVersion,
  });

  String? status;
  Response? response;
  String? etag;
  DateTime? modified;
  DateTime? datetime;
  String? apiVersion;

  factory MatchDetailsLiveModel.fromJson(Map<String, dynamic> json) =>
      MatchDetailsLiveModel(
        status: json["status"] == null ? null : json["status"],
        response: json["response"] == null
            ? null
            : Response.fromJson(json["response"]),
        etag: json["etag"] == null ? null : json["etag"],
        modified:
            json["modified"] == null ? null : DateTime.parse(json["modified"]),
        datetime:
            json["datetime"] == null ? null : DateTime.parse(json["datetime"]),
        apiVersion: json["api_version"] == null ? null : json["api_version"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "response": response == null ? null : response!.toJson(),
        "etag": etag == null ? null : etag,
        "modified": modified == null ? null : modified!.toIso8601String(),
        "datetime": datetime == null ? null : datetime!.toIso8601String(),
        "api_version": apiVersion == null ? null : apiVersion,
      };
}

class Response {
  Response({
    this.mid,
    this.status,
    this.statusStr,
    this.gameState,
    this.gameStateStr,
    this.statusNote,
    this.dayRemainingOver,
    this.teamBatting,
    this.teamBowling,
    this.liveInningNumber,
    this.liveScore,
    this.batsmen,
    this.bowlers,
    this.commentary,
    this.wagon,
    this.commentaries,
    this.liveInning,
    this.teams,
    this.players,
  });

  int? mid;
  int? status;
  String? statusStr;
  int? gameState;
  String? gameStateStr;
  String? statusNote;
  String? dayRemainingOver;
  TeamBatting? teamBatting;
  TeamBatting? teamBowling;
  int? liveInningNumber;
  LiveScore? liveScore;
  List<ResponseBatsman>? batsmen;
  List<Bowler>? bowlers;
  int? commentary;
  int? wagon;
  List<Commentary>? commentaries;
  LiveInning? liveInning;
  List<Team>? teams;
  List<Player>? players;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        mid: json["mid"] == null ? null : json["mid"],
        status: json["status"] == null ? null : json["status"],
        statusStr: json["status_str"] == null ? null : json["status_str"],
        gameState: json["game_state"] == null ? null : json["game_state"],
        gameStateStr:
            json["game_state_str"] == null ? null : json["game_state_str"],
        statusNote: json["status_note"] == null ? null : json["status_note"],
        dayRemainingOver: json["day_remaining_over"] == null
            ? null
            : json["day_remaining_over"],
        teamBatting: json["team_batting"] == null
            ? null
            : teamBattingValues.map[json["team_batting"]],
        teamBowling: json["team_bowling"] == null
            ? null
            : teamBattingValues.map[json["team_bowling"]],
        liveInningNumber: json["live_inning_number"] == null
            ? null
            : json["live_inning_number"],
        liveScore: json["live_score"] == null
            ? null
            : LiveScore.fromJson(json["live_score"]),
        batsmen: json["batsmen"] == null
            ? null
            : List<ResponseBatsman>.from(
                json["batsmen"].map((x) => ResponseBatsman.fromJson(x))),
        bowlers: json["bowlers"] == null
            ? null
            : List<Bowler>.from(json["bowlers"].map((x) => Bowler.fromJson(x))),
        commentary: json["commentary"] == null ? null : json["commentary"],
        wagon: json["wagon"] == null ? null : json["wagon"],
        commentaries: json["commentaries"] == null
            ? null
            : List<Commentary>.from(
                json["commentaries"].map((x) => Commentary.fromJson(x))),
        liveInning: json["live_inning"] == null
            ? null
            : LiveInning.fromJson(json["live_inning"]),
        teams: json["teams"] == null
            ? null
            : List<Team>.from(json["teams"].map((x) => Team.fromJson(x))),
        players: json["players"] == null
            ? null
            : List<Player>.from(json["players"].map((x) => Player.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mid": mid == null ? null : mid,
        "status": status == null ? null : status,
        "status_str": statusStr == null ? null : statusStr,
        "game_state": gameState == null ? null : gameState,
        "game_state_str": gameStateStr == null ? null : gameStateStr,
        "status_note": statusNote == null ? null : statusNote,
        "day_remaining_over":
            dayRemainingOver == null ? null : dayRemainingOver,
        "team_batting":
            teamBatting == null ? null : teamBattingValues.reverse[teamBatting],
        "team_bowling":
            teamBowling == null ? null : teamBattingValues.reverse[teamBowling],
        "live_inning_number":
            liveInningNumber == null ? null : liveInningNumber,
        "live_score": liveScore == null ? null : liveScore!.toJson(),
        "batsmen": batsmen == null
            ? null
            : List<dynamic>.from(batsmen!.map((x) => x.toJson())),
        "bowlers": bowlers == null
            ? null
            : List<dynamic>.from(bowlers!.map((x) => x.toJson())),
        "commentary": commentary == null ? null : commentary,
        "wagon": wagon == null ? null : wagon,
        "commentaries": commentaries == null
            ? null
            : List<dynamic>.from(commentaries!.map((x) => x.toJson())),
        "live_inning": liveInning == null ? null : liveInning!.toJson(),
        "teams": teams == null
            ? null
            : List<dynamic>.from(teams!.map((x) => x.toJson())),
        "players": players == null
            ? null
            : List<dynamic>.from(players!.map((x) => x.toJson())),
      };
}

class ResponseBatsman {
  ResponseBatsman({
    this.name,
    this.batsmanId,
    this.runs,
    this.ballsFaced,
    this.fours,
    this.sixes,
    this.strikeRate,
  });

  String? name;
  int? batsmanId;
  int? runs;
  int? ballsFaced;
  int? fours;
  int? sixes;
  String? strikeRate;

  factory ResponseBatsman.fromJson(Map<String, dynamic> json) =>
      ResponseBatsman(
        name: json["name"] == null ? null : json["name"],
        batsmanId: json["batsman_id"] == null ? null : json["batsman_id"],
        runs: json["runs"] == null ? null : json["runs"],
        ballsFaced: json["balls_faced"] == null ? null : json["balls_faced"],
        fours: json["fours"] == null ? null : json["fours"],
        sixes: json["sixes"] == null ? null : json["sixes"],
        strikeRate: json["strike_rate"] == null ? null : json["strike_rate"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "batsman_id": batsmanId == null ? null : batsmanId,
        "runs": runs == null ? null : runs,
        "balls_faced": ballsFaced == null ? null : ballsFaced,
        "fours": fours == null ? null : fours,
        "sixes": sixes == null ? null : sixes,
        "strike_rate": strikeRate == null ? null : strikeRate,
      };
}

class Bowler {
  Bowler({
    this.name,
    this.bowlerId,
    this.overs,
    this.runsConceded,
    this.wickets,
    this.maidens,
    this.econ,
  });

  String? name;
  int? bowlerId;
  dynamic overs;
  int? runsConceded;
  int? wickets;
  int? maidens;
  dynamic econ;

  factory Bowler.fromJson(Map<String, dynamic> json) => Bowler(
        name: json["name"] == null ? null : json["name"],
        bowlerId: json["bowler_id"] == null ? null : json["bowler_id"],
        overs: json["overs"] == null ? null : json["overs"],
        runsConceded:
            json["runs_conceded"] == null ? null : json["runs_conceded"],
        wickets: json["wickets"] == null ? null : json["wickets"],
        maidens: json["maidens"] == null ? null : json["maidens"],
        econ: json["econ"] == null ? null : json["econ"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "bowler_id": bowlerId == null ? null : bowlerId,
        "overs": overs == null ? null : overs,
        "runs_conceded": runsConceded == null ? null : runsConceded,
        "wickets": wickets == null ? null : wickets,
        "maidens": maidens == null ? null : maidens,
        "econ": econ == null ? null : econ,
      };
}

class Commentary {
  Commentary({
    this.event,
    this.batsmanId,
    this.bowlerId,
    this.over,
    this.ball,
    this.score,
    this.commentary,
    this.noballDismissal,
    this.text,
    this.runs,
    this.bats,
    this.bowls,
  });

  Event? event;
  dynamic batsmanId;
  dynamic bowlerId;
  dynamic over;
  String? ball;
  dynamic score;
  String? commentary;
  bool? noballDismissal;
  String? text;
  int? runs;
  List<Bat>? bats;
  List<Bowl>? bowls;

  factory Commentary.fromJson(Map<String, dynamic> json) => Commentary(
        event: json["event"] == null ? null : eventValues.map[json["event"]],
        batsmanId: json["batsman_id"] == null ? null : json["batsman_id"],
        bowlerId: json["bowler_id"] == null ? null : json["bowler_id"],
        over: json["over"],
        ball: json["ball"] == null ? null : json["ball"],
        score: json["score"],
        commentary: json["commentary"] == null ? null : json["commentary"],
        noballDismissal:
            json["noball_dismissal"] == null ? null : json["noball_dismissal"],
        text: json["text"] == null ? null : json["text"],
        runs: json["runs"] == null ? null : json["runs"],
        bats: json["bats"] == null
            ? null
            : List<Bat>.from(json["bats"].map((x) => Bat.fromJson(x))),
        bowls: json["bowls"] == null
            ? null
            : List<Bowl>.from(json["bowls"].map((x) => Bowl.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "event": event == null ? null : eventValues.reverse[event],
        "batsman_id": batsmanId == null ? null : batsmanId,
        "bowler_id": bowlerId == null ? null : bowlerId,
        "over": over,
        "ball": ball == null ? null : ball,
        "score": score,
        "commentary": commentary == null ? null : commentary,
        "noball_dismissal": noballDismissal == null ? null : noballDismissal,
        "text": text == null ? null : text,
        "runs": runs == null ? null : runs,
        "bats": bats == null
            ? null
            : List<dynamic>.from(bats!.map((x) => x.toJson())),
        "bowls": bowls == null
            ? null
            : List<dynamic>.from(bowls!.map((x) => x.toJson())),
      };
}

class Bat {
  Bat({
    this.runs,
    this.ballsFaced,
    this.fours,
    this.sixes,
    this.batsmanId,
  });

  int? runs;
  int? ballsFaced;
  int? fours;
  int? sixes;
  dynamic batsmanId;

  factory Bat.fromJson(Map<String, dynamic> json) => Bat(
        runs: json["runs"] == null ? null : json["runs"],
        ballsFaced: json["balls_faced"] == null ? null : json["balls_faced"],
        fours: json["fours"] == null ? null : json["fours"],
        sixes: json["sixes"] == null ? null : json["sixes"],
        batsmanId: json["batsman_id"] == null ? null : json["batsman_id"],
      );

  Map<String, dynamic> toJson() => {
        "runs": runs == null ? null : runs,
        "balls_faced": ballsFaced == null ? null : ballsFaced,
        "fours": fours == null ? null : fours,
        "sixes": sixes == null ? null : sixes,
        "batsman_id": batsmanId == null ? null : batsmanId,
      };
}

class Bowl {
  Bowl({
    this.runsConceded,
    this.overs,
    this.wickets,
    this.maidens,
    this.bowlerId,
  });

  int? runsConceded;
  dynamic overs;
  int? wickets;
  int? maidens;
  dynamic bowlerId;

  factory Bowl.fromJson(Map<String, dynamic> json) => Bowl(
        runsConceded:
            json["runs_conceded"] == null ? null : json["runs_conceded"],
        overs: json["overs"] == null ? null : json["overs"],
        wickets: json["wickets"] == null ? null : json["wickets"],
        maidens: json["maidens"] == null ? null : json["maidens"],
        bowlerId: json["bowler_id"] == null ? null : json["bowler_id"],
      );

  Map<String, dynamic> toJson() => {
        "runs_conceded": runsConceded == null ? null : runsConceded,
        "overs": overs == null ? null : overs,
        "wickets": wickets == null ? null : wickets,
        "maidens": maidens == null ? null : maidens,
        "bowler_id": bowlerId == null ? null : bowlerId,
      };
}

enum Event { BALL, OVEREND, WICKET }

final eventValues = EnumValues({
  "ball": Event.BALL,
  "overend": Event.OVEREND,
  "wicket": Event.WICKET,
});

class LiveInning {
  LiveInning({
    this.iid,
    this.number,
    this.name,
    this.shortName,
    this.status,
    this.result,
    this.battingTeamId,
    this.fieldingTeamId,
    this.scores,
    this.scoresFull,
    this.fielder,
    this.lastWicket,
    this.extraRuns,
    this.equations,
    this.currentPartnership,
    this.didNotBat,
    this.recentScores,
    this.lastFiveOvers,
    this.lastTenOvers,
  });

  int? iid;
  int? number;
  String? name;
  String? shortName;
  int? status;
  int? result;
  int? battingTeamId;
  int? fieldingTeamId;
  String? scores;
  String? scoresFull;
  List<Fielder>? fielder;
  dynamic lastWicket;
  ExtraRuns? extraRuns;
  Equations? equations;
  CurrentPartnership? currentPartnership;
  List<DidNotBat>? didNotBat;
  String? recentScores;
  String? lastFiveOvers;
  String? lastTenOvers;

  factory LiveInning.fromJson(Map<String, dynamic> json) => LiveInning(
        iid: json["iid"] == null ? null : json["iid"],
        number: json["number"] == null ? null : json["number"],
        name: json["name"] == null ? null : json["name"],
        shortName: json["short_name"] == null ? null : json["short_name"],
        status: json["status"] == null ? null : json["status"],
        result: json["result"] == null ? null : json["result"],
        battingTeamId:
            json["batting_team_id"] == null ? null : json["batting_team_id"],
        fieldingTeamId:
            json["fielding_team_id"] == null ? null : json["fielding_team_id"],
        scores: json["scores"] == null ? null : json["scores"],
        scoresFull: json["scores_full"] == null ? null : json["scores_full"],
        fielder: json["fielder"] == null
            ? null
            : List<Fielder>.from(
                json["fielder"].map((x) => Fielder.fromJson(x))),
        lastWicket: json["last_wicket"] == null
            ? null
            : json["last_wicket"].runtimeType.toString() == 'bool'
              ? json["last_wicket"]
              : LastWicket.fromJson(json["last_wicket"]),
        extraRuns: json["extra_runs"] == null
            ? null
            : ExtraRuns.fromJson(json["extra_runs"]),
        equations: json["equations"] == null
            ? null
            : Equations.fromJson(json["equations"]),
        currentPartnership: json["current_partnership"] == null
            ? null
            : CurrentPartnership.fromJson(json["current_partnership"]),
        didNotBat: json["did_not_bat"] == null
            ? null
            : List<DidNotBat>.from(
                json["did_not_bat"].map((x) => DidNotBat.fromJson(x))),
        recentScores:
            json["recent_scores"] == null ? null : json["recent_scores"],
        lastFiveOvers:
            json["last_five_overs"] == null ? null : json["last_five_overs"],
        lastTenOvers:
            json["last_ten_overs"] == null ? null : json["last_ten_overs"],
      );

  Map<String, dynamic> toJson() => {
        "iid": iid == null ? null : iid,
        "number": number == null ? null : number,
        "name": name == null ? null : name,
        "short_name": shortName == null ? null : shortName,
        "status": status == null ? null : status,
        "result": result == null ? null : result,
        "batting_team_id": battingTeamId == null ? null : battingTeamId,
        "fielding_team_id": fieldingTeamId == null ? null : fieldingTeamId,
        "scores": scores == null ? null : scores,
        "scores_full": scoresFull == null ? null : scoresFull,
        "fielder": fielder == null
            ? null
            : List<dynamic>.from(fielder!.map((x) => x.toJson())),
        "last_wicket": lastWicket == null ? null : lastWicket!.toJson(),
        "extra_runs": extraRuns == null ? null : extraRuns!.toJson(),
        "equations": equations == null ? null : equations!.toJson(),
        "current_partnership":
            currentPartnership == null ? null : currentPartnership!.toJson(),
        "did_not_bat": didNotBat == null
            ? null
            : List<dynamic>.from(didNotBat!.map((x) => x.toJson())),
        "recent_scores": recentScores == null ? null : recentScores,
        "last_five_overs": lastFiveOvers == null ? null : lastFiveOvers,
        "last_ten_overs": lastTenOvers == null ? null : lastTenOvers,
      };
}

class CurrentPartnership {
  CurrentPartnership({
    this.runs,
    this.balls,
    this.overs,
    this.batsmen,
  });

  int? runs;
  int? balls;
  double? overs;
  List<CurrentPartnershipBatsman>? batsmen;

  factory CurrentPartnership.fromJson(Map<String, dynamic> json) =>
      CurrentPartnership(
        runs: json["runs"] == null ? null : json["runs"],
        balls: json["balls"] == null ? null : json["balls"],
        overs: json["overs"] == null ? null : json["overs"].toDouble(),
        batsmen: json["batsmen"] == null
            ? null
            : List<CurrentPartnershipBatsman>.from(json["batsmen"]
                .map((x) => CurrentPartnershipBatsman.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "runs": runs == null ? null : runs,
        "balls": balls == null ? null : balls,
        "overs": overs == null ? null : overs,
        "batsmen": batsmen == null
            ? null
            : List<dynamic>.from(batsmen!.map((x) => x.toJson())),
      };
}

class CurrentPartnershipBatsman {
  CurrentPartnershipBatsman({
    this.name,
    this.batsmanId,
    this.runs,
    this.balls,
  });

  String? name;
  dynamic batsmanId;
  int? runs;
  int? balls;

  factory CurrentPartnershipBatsman.fromJson(Map<String, dynamic> json) =>
      CurrentPartnershipBatsman(
        name: json["name"] == null ? null : json["name"],
        batsmanId: json["batsman_id"] == null ? null : json["batsman_id"],
        runs: json["runs"] == null ? null : json["runs"],
        balls: json["balls"] == null ? null : json["balls"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "batsman_id": batsmanId == null ? null : batsmanId,
        "runs": runs == null ? null : runs,
        "balls": balls == null ? null : balls,
      };
}

class DidNotBat {
  DidNotBat({
    this.playerId,
    this.name,
  });

  String? playerId;
  String? name;

  factory DidNotBat.fromJson(Map<String, dynamic> json) => DidNotBat(
        playerId: json["player_id"] == null ? null : json["player_id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "player_id": playerId == null ? null : playerId,
        "name": name == null ? null : name,
      };
}

class Equations {
  Equations({
    this.runs,
    this.wickets,
    this.overs,
    this.bowlersUsed,
    this.runrate,
  });

  int? runs;
  int? wickets;
  String? overs;
  int? bowlersUsed;
  String? runrate;

  factory Equations.fromJson(Map<String, dynamic> json) => Equations(
        runs: json["runs"] == null ? null : json["runs"],
        wickets: json["wickets"] == null ? null : json["wickets"],
        overs: json["overs"] == null ? null : json["overs"],
        bowlersUsed: json["bowlers_used"] == null ? null : json["bowlers_used"],
        runrate: json["runrate"] == null ? null : json["runrate"],
      );

  Map<String, dynamic> toJson() => {
        "runs": runs == null ? null : runs,
        "wickets": wickets == null ? null : wickets,
        "overs": overs == null ? null : overs,
        "bowlers_used": bowlersUsed == null ? null : bowlersUsed,
        "runrate": runrate == null ? null : runrate,
      };
}

class ExtraRuns {
  ExtraRuns({
    this.byes,
    this.legbyes,
    this.wides,
    this.noballs,
    this.penalty,
    this.total,
  });

  int? byes;
  int? legbyes;
  int? wides;
  int? noballs;
  String? penalty;
  int? total;

  factory ExtraRuns.fromJson(Map<String, dynamic> json) => ExtraRuns(
        byes: json["byes"] == null ? null : json["byes"],
        legbyes: json["legbyes"] == null ? null : json["legbyes"],
        wides: json["wides"] == null ? null : json["wides"],
        noballs: json["noballs"] == null ? null : json["noballs"],
        penalty: json["penalty"] == null ? null : json["penalty"],
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toJson() => {
        "byes": byes == null ? null : byes,
        "legbyes": legbyes == null ? null : legbyes,
        "wides": wides == null ? null : wides,
        "noballs": noballs == null ? null : noballs,
        "penalty": penalty == null ? null : penalty,
        "total": total == null ? null : total,
      };
}

class Fielder {
  Fielder({
    this.fielderId,
    this.fielderName,
    this.catches,
    this.runoutThrower,
    this.runoutCatcher,
    this.runoutDirectHit,
    this.stumping,
    this.isSubstitute,
  });

  String? fielderId;
  String? fielderName;
  int? catches;
  int? runoutThrower;
  int? runoutCatcher;
  int? runoutDirectHit;
  int? stumping;
  String? isSubstitute;

  factory Fielder.fromJson(Map<String, dynamic> json) => Fielder(
        fielderId: json["fielder_id"] == null ? null : json["fielder_id"],
        fielderName: json["fielder_name"] == null ? null : json["fielder_name"],
        catches: json["catches"] == null ? null : json["catches"],
        runoutThrower:
            json["runout_thrower"] == null ? null : json["runout_thrower"],
        runoutCatcher:
            json["runout_catcher"] == null ? null : json["runout_catcher"],
        runoutDirectHit: json["runout_direct_hit"] == null
            ? null
            : json["runout_direct_hit"],
        stumping: json["stumping"] == null ? null : json["stumping"],
        isSubstitute:
            json["is_substitute"] == null ? null : json["is_substitute"],
      );

  Map<String, dynamic> toJson() => {
        "fielder_id": fielderId == null ? null : fielderId,
        "fielder_name": fielderName == null ? null : fielderName,
        "catches": catches == null ? null : catches,
        "runout_thrower": runoutThrower == null ? null : runoutThrower,
        "runout_catcher": runoutCatcher == null ? null : runoutCatcher,
        "runout_direct_hit": runoutDirectHit == null ? null : runoutDirectHit,
        "stumping": stumping == null ? null : stumping,
        "is_substitute": isSubstitute == null ? null : isSubstitute,
      };
}

class LastWicket {
  LastWicket({
    this.name,
    this.batsmanId,
    this.runs,
    this.balls,
    this.howOut,
    this.scoreAtDismissal,
    this.oversAtDismissal,
    this.bowlerId,
    this.dismissal,
    this.number,
  });

  String? name;
  dynamic batsmanId;
  String? runs;
  String? balls;
  String? howOut;
  int? scoreAtDismissal;
  String? oversAtDismissal;
  String? bowlerId;
  String? dismissal;
  int? number;

  factory LastWicket.fromJson(Map<String, dynamic> json) => LastWicket(
        name: json["name"] == null ? null : json["name"],
        batsmanId: json["batsman_id"] == null ? null : json["batsman_id"],
        runs: json["runs"] == null ? null : json["runs"],
        balls: json["balls"] == null ? null : json["balls"],
        howOut: json["how_out"] == null ? null : json["how_out"],
        scoreAtDismissal: json["score_at_dismissal"] == null
            ? null
            : json["score_at_dismissal"],
        oversAtDismissal: json["overs_at_dismissal"] == null
            ? null
            : json["overs_at_dismissal"],
        bowlerId: json["bowler_id"] == null ? null : json["bowler_id"],
        dismissal: json["dismissal"] == null ? null : json["dismissal"],
        number: json["number"] == null ? null : json["number"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "batsman_id": batsmanId == null ? null : batsmanId,
        "runs": runs == null ? null : runs,
        "balls": balls == null ? null : balls,
        "how_out": howOut == null ? null : howOut,
        "score_at_dismissal":
            scoreAtDismissal == null ? null : scoreAtDismissal,
        "overs_at_dismissal":
            oversAtDismissal == null ? null : oversAtDismissal,
        "bowler_id": bowlerId == null ? null : bowlerId,
        "dismissal": dismissal == null ? null : dismissal,
        "number": number == null ? null : number,
      };
}

class LiveScore {
  LiveScore({
    this.runs,
    this.overs,
    this.wickets,
    this.target,
    this.runrate,
    this.requiredRunrate,
  });

  int? runs;
  dynamic overs;
  int? wickets;
  int? target;
  dynamic runrate;
  dynamic requiredRunrate;

  factory LiveScore.fromJson(Map<String, dynamic> json) => LiveScore(
        runs: json["runs"] == null ? null : json["runs"],
        overs: json["overs"] == null ? null : json["overs"],
        wickets: json["wickets"] == null ? null : json["wickets"],
        target: json["target"] == null ? null : json["target"],
        runrate: json["runrate"] == null ? null : json["runrate"].toDouble(),
        requiredRunrate:
            json["required_runrate"] == null ? null : json["required_runrate"],
      );

  Map<String, dynamic> toJson() => {
        "runs": runs == null ? null : runs,
        "overs": overs == null ? null : overs,
        "wickets": wickets == null ? null : wickets,
        "target": target == null ? null : target,
        "runrate": runrate == null ? null : runrate,
        "required_runrate": requiredRunrate == null ? null : requiredRunrate,
      };
}

class Player {
  Player({
    this.pid,
    this.title,
    this.shortName,
    this.firstName,
    this.lastName,
    this.middleName,
    this.birthdate,
    this.birthplace,
    this.country,
    this.primaryTeam,
    this.thumbUrl,
    this.logoUrl,
    this.playingRole,
    this.battingStyle,
    this.bowlingStyle,
    this.fieldingPosition,
    this.recentMatch,
    this.recentAppearance,
    this.fantasyPlayerRating,
    this.nationality,
    this.role,
  });

  dynamic pid;
  String? title;
  String? shortName;
  String? firstName;
  String? lastName;
  String? middleName;
  DateTime? birthdate;
  String? birthplace;
  Country? country;
  List<dynamic>? primaryTeam;
  String? thumbUrl;
  String? logoUrl;
  PlayingRole? playingRole;
  BattingStyle? battingStyle;
  String? bowlingStyle;
  String? fieldingPosition;
  int? recentMatch;
  int? recentAppearance;
  double? fantasyPlayerRating;
  TeamBatting? nationality;
  String? role;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        pid: json["pid"] == null ? null : json["pid"],
        title: json["title"] == null ? null : json["title"],
        shortName: json["short_name"] == null ? null : json["short_name"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        middleName: json["middle_name"] == null ? null : json["middle_name"],
        birthdate: json["birthdate"] == null
            ? null
            : DateTime.parse(json["birthdate"]),
        birthplace: json["birthplace"] == null ? null : json["birthplace"],
        country:
            json["country"] == null ? null : countryValues.map[json["country"]],
        primaryTeam: json["primary_team"] == null
            ? null
            : List<dynamic>.from(json["primary_team"].map((x) => x)),
        thumbUrl: json["thumb_url"] == null ? null : json["thumb_url"],
        logoUrl: json["logo_url"] == null ? null : json["logo_url"],
        playingRole: json["playing_role"] == null
            ? null
            : playingRoleValues.map[json["playing_role"]],
        battingStyle: json["batting_style"] == null
            ? null
            : battingStyleValues.map[json["batting_style"]],
        bowlingStyle:
            json["bowling_style"] == null ? null : json["bowling_style"],
        fieldingPosition: json["fielding_position"] == null
            ? null
            : json["fielding_position"],
        recentMatch: json["recent_match"] == null ? null : json["recent_match"],
        recentAppearance: json["recent_appearance"] == null
            ? null
            : json["recent_appearance"],
        fantasyPlayerRating: json["fantasy_player_rating"] == null
            ? null
            : json["fantasy_player_rating"].toDouble(),
        nationality: json["nationality"] == null
            ? null
            : teamBattingValues.map[json["nationality"]],
        role: json["role"] == null ? null : json["role"],
      );

  Map<String, dynamic> toJson() => {
        "pid": pid == null ? null : pid,
        "title": title == null ? null : title,
        "short_name": shortName == null ? null : shortName,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "middle_name": middleName == null ? null : middleName,
        "birthdate": birthdate == null
            ? null
            : "${birthdate!.year.toString().padLeft(4, '0')}-${birthdate!.month.toString().padLeft(2, '0')}-${birthdate!.day.toString().padLeft(2, '0')}",
        "birthplace": birthplace == null ? null : birthplace,
        "country": country == null ? null : countryValues.reverse[country],
        "primary_team": primaryTeam == null
            ? null
            : List<dynamic>.from(primaryTeam!.map((x) => x)),
        "thumb_url": thumbUrl == null ? null : thumbUrl,
        "logo_url": logoUrl == null ? null : logoUrl,
        "playing_role":
            playingRole == null ? null : playingRoleValues.reverse[playingRole],
        "batting_style": battingStyle == null
            ? null
            : battingStyleValues.reverse[battingStyle],
        "bowling_style": bowlingStyle == null ? null : bowlingStyle,
        "fielding_position": fieldingPosition == null ? null : fieldingPosition,
        "recent_match": recentMatch == null ? null : recentMatch,
        "recent_appearance": recentAppearance == null ? null : recentAppearance,
        "fantasy_player_rating":
            fantasyPlayerRating == null ? null : fantasyPlayerRating,
        "nationality":
            nationality == null ? null : teamBattingValues.reverse[nationality],
        "role": role == null ? null : role,
      };
}

enum BattingStyle { RIGHT_HAND_BAT, LEFT_HAND_BAT }

final battingStyleValues = EnumValues({
  "Left hand Bat": BattingStyle.LEFT_HAND_BAT,
  "Right Hand Bat": BattingStyle.RIGHT_HAND_BAT
});

enum Country { NZ, ZA }

final countryValues = EnumValues({"nz": Country.NZ, "za": Country.ZA});

enum TeamBatting { NEW_ZEALAND, SOUTH_AFRICA }

final teamBattingValues = EnumValues({
  "New Zealand": TeamBatting.NEW_ZEALAND,
  "South Africa": TeamBatting.SOUTH_AFRICA
});

enum PlayingRole { BOWL, WK, ALL, BAT }

final playingRoleValues = EnumValues({
  "all": PlayingRole.ALL,
  "bat": PlayingRole.BAT,
  "bowl": PlayingRole.BOWL,
  "wk": PlayingRole.WK
});

class Team {
  Team({
    this.tid,
    this.title,
    this.abbr,
    this.thumbUrl,
    this.logoUrl,
    this.type,
    this.country,
    this.altName,
    this.sex,
  });

  int? tid;
  TeamBatting? title;
  String? abbr;
  String? thumbUrl;
  String? logoUrl;
  String? type;
  Country? country;
  TeamBatting? altName;
  String? sex;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        tid: json["tid"] == null ? null : json["tid"],
        title:
            json["title"] == null ? null : teamBattingValues.map[json["title"]],
        abbr: json["abbr"] == null ? null : json["abbr"],
        thumbUrl: json["thumb_url"] == null ? null : json["thumb_url"],
        logoUrl: json["logo_url"] == null ? null : json["logo_url"],
        type: json["type"] == null ? null : json["type"],
        country:
            json["country"] == null ? null : countryValues.map[json["country"]],
        altName: json["alt_name"] == null
            ? null
            : teamBattingValues.map[json["alt_name"]],
        sex: json["sex"] == null ? null : json["sex"],
      );

  Map<String, dynamic> toJson() => {
        "tid": tid == null ? null : tid,
        "title": title == null ? null : teamBattingValues.reverse[title],
        "abbr": abbr == null ? null : abbr,
        "thumb_url": thumbUrl == null ? null : thumbUrl,
        "logo_url": logoUrl == null ? null : logoUrl,
        "type": type == null ? null : type,
        "country": country == null ? null : countryValues.reverse[country],
        "alt_name": altName == null ? null : teamBattingValues.reverse[altName],
        "sex": sex == null ? null : sex,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
