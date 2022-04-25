// To parse this JSON data, do
//
//     final matchDetailsScoreboardModel = matchDetailsScoreboardModelFromJson(jsonString?);

import 'dart:convert';

MatchDetailsScoreboardModel matchDetailsScoreboardModelFromJson(String? str) =>
    MatchDetailsScoreboardModel.fromJson(json.decode(str!));

String? matchDetailsScoreboardModelToJson(MatchDetailsScoreboardModel data) =>
    json.encode(data.toJson());

class MatchDetailsScoreboardModel {
  MatchDetailsScoreboardModel({
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

  factory MatchDetailsScoreboardModel.fromJson(Map<String?, dynamic> json) =>
      MatchDetailsScoreboardModel(
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

  Map<String?, dynamic> toJson() => {
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
    this.matchId,
    this.title,
    this.shortTitle,
    this.subtitle,
    this.format,
    this.formatStr,
    this.status,
    this.statusStr,
    this.statusNote,
    this.verified,
    this.preSquad,
    this.oddsAvailable,
    this.gameState,
    this.gameStateStr,
    this.competition,
    this.teama,
    this.teamb,
    this.dateStart,
    this.dateEnd,
    this.timestampStart,
    this.timestampEnd,
    this.dateStartIst,
    this.dateEndIst,
    this.venue,
    this.umpires,
    this.referee,
    this.equation,
    this.live,
    this.result,
    this.resultType,
    this.winMargin,
    this.winningTeamId,
    this.commentary,
    this.wagon,
    this.latestInningNumber,
    this.presquadTime,
    this.verifyTime,
    this.toss,
    this.currentOver,
    this.previousOver,
    this.manOfTheMatch,
    this.manOfTheSeries,
    this.isFollowon,
    this.teamBattingFirst,
    this.teamBattingSecond,
    this.lastFiveOvers,
    this.liveInningNumber,
    this.innings,
    this.players,
    this.preMatchOdds,
  });

  int? matchId;
  String? title;
  String? shortTitle;
  String? subtitle;
  int? format;
  String? formatStr;
  int? status;
  String? statusStr;
  String? statusNote;
  String? verified;
  String? preSquad;
  String? oddsAvailable;
  int? gameState;
  String? gameStateStr;
  Competition? competition;
  Team? teama;
  Team? teamb;
  DateTime? dateStart;
  DateTime? dateEnd;
  int? timestampStart;
  int? timestampEnd;
  DateTime? dateStartIst;
  DateTime? dateEndIst;
  Venue? venue;
  String? umpires;
  String? referee;
  String? equation;
  String? live;
  String? result;
  String? resultType;
  String? winMargin;
  int? winningTeamId;
  int? commentary;
  int? wagon;
  int? latestInningNumber;
  DateTime? presquadTime;
  String? verifyTime;
  Toss? toss;
  String? currentOver;
  String? previousOver;
  String? manOfTheMatch;
  String? manOfTheSeries;
  int? isFollowon;
  String? teamBattingFirst;
  String? teamBattingSecond;
  String? lastFiveOvers;
  String? liveInningNumber;
  List<Inning>? innings;
  List<Player>? players;
  List<dynamic>? preMatchOdds;

  factory Response.fromJson(Map<String?, dynamic> json) => Response(
        matchId: json["match_id"] == null ? null : json["match_id"],
        title: json["title"] == null ? null : json["title"],
        shortTitle: json["short_title"] == null ? null : json["short_title"],
        subtitle: json["subtitle"] == null ? null : json["subtitle"],
        format: json["format"] == null ? null : json["format"],
        formatStr: json["format_str"] == null ? null : json["format_str"],
        status: json["status"] == null ? null : json["status"],
        statusStr: json["status_str"] == null ? null : json["status_str"],
        statusNote: json["status_note"] == null ? null : json["status_note"],
        verified: json["verified"] == null ? null : json["verified"],
        preSquad: json["pre_squad"] == null ? null : json["pre_squad"],
        oddsAvailable:
            json["odds_available"] == null ? null : json["odds_available"],
        gameState: json["game_state"] == null ? null : json["game_state"],
        gameStateStr:
            json["game_state_str"] == null ? null : json["game_state_str"],
        competition: json["competition"] == null
            ? null
            : Competition.fromJson(json["competition"]),
        teama: json["teama"] == null ? null : Team.fromJson(json["teama"]),
        teamb: json["teamb"] == null ? null : Team.fromJson(json["teamb"]),
        dateStart: json["date_start"] == null
            ? null
            : DateTime.parse(json["date_start"]),
        dateEnd:
            json["date_end"] == null ? null : DateTime.parse(json["date_end"]),
        timestampStart:
            json["timestamp_start"] == null ? null : json["timestamp_start"],
        timestampEnd:
            json["timestamp_end"] == null ? null : json["timestamp_end"],
        dateStartIst: json["date_start_ist"] == null
            ? null
            : DateTime.parse(json["date_start_ist"]),
        dateEndIst: json["date_end_ist"] == null
            ? null
            : DateTime.parse(json["date_end_ist"]),
        venue: json["venue"] == null ? null : Venue.fromJson(json["venue"]),
        umpires: json["umpires"] == null ? null : json["umpires"],
        referee: json["referee"] == null ? null : json["referee"],
        equation: json["equation"] == null ? null : json["equation"],
        live: json["live"] == null ? null : json["live"],
        result: json["result"] == null ? null : json["result"],
        resultType: json["result_type"] == null ? null : json["result_type"],
        winMargin: json["win_margin"] == null ? null : json["win_margin"],
        winningTeamId:
            json["winning_team_id"] == null ? null : json["winning_team_id"],
        commentary: json["commentary"] == null ? null : json["commentary"],
        wagon: json["wagon"] == null ? null : json["wagon"],
        latestInningNumber: json["latest_inning_number"] == null
            ? null
            : json["latest_inning_number"],
        presquadTime: json["presquad_time"] == null
            ? null
            : DateTime.parse(json["presquad_time"]),
        verifyTime: json["verify_time"] == null ? null : json["verify_time"],
        toss: json["toss"] == null ? null : Toss.fromJson(json["toss"]),
        currentOver: json["current_over"] == null ? null : json["current_over"],
        previousOver:
            json["previous_over"] == null ? null : json["previous_over"],
        manOfTheMatch:
            json["man_of_the_match"] == null ? null : json["man_of_the_match"],
        manOfTheSeries: json["man_of_the_series"] == null
            ? null
            : json["man_of_the_series"],
        isFollowon: json["is_followon"] == null ? null : json["is_followon"],
        teamBattingFirst: json["team_batting_first"] == null
            ? null
            : json["team_batting_first"],
        teamBattingSecond: json["team_batting_second"] == null
            ? null
            : json["team_batting_second"],
        lastFiveOvers:
            json["last_five_overs"] == null ? null : json["last_five_overs"],
        liveInningNumber: json["live_inning_number"] == null
            ? null
            : json["live_inning_number"],
        innings: json["innings"] == null
            ? null
            : List<Inning>.from(json["innings"].map((x) => Inning.fromJson(x))),
        players: json["players"] == null
            ? null
            : List<Player>.from(json["players"].map((x) => Player.fromJson(x))),
        preMatchOdds: json["pre_match_odds"] == null
            ? null
            : List<dynamic>.from(json["pre_match_odds"].map((x) => x)),
      );

  Map<String?, dynamic> toJson() => {
        "match_id": matchId == null ? null : matchId,
        "title": title == null ? null : title,
        "short_title": shortTitle == null ? null : shortTitle,
        "subtitle": subtitle == null ? null : subtitle,
        "format": format == null ? null : format,
        "format_str": formatStr == null ? null : formatStr,
        "status": status == null ? null : status,
        "status_str": statusStr == null ? null : statusStr,
        "status_note": statusNote == null ? null : statusNote,
        "verified": verified == null ? null : verified,
        "pre_squad": preSquad == null ? null : preSquad,
        "odds_available": oddsAvailable == null ? null : oddsAvailable,
        "game_state": gameState == null ? null : gameState,
        "game_state_str": gameStateStr == null ? null : gameStateStr,
        "competition": competition == null ? null : competition!.toJson(),
        "teama": teama == null ? null : teama!.toJson(),
        "teamb": teamb == null ? null : teamb!.toJson(),
        "date_start": dateStart == null ? null : dateStart!.toIso8601String(),
        "date_end": dateEnd == null ? null : dateEnd!.toIso8601String(),
        "timestamp_start": timestampStart == null ? null : timestampStart,
        "timestamp_end": timestampEnd == null ? null : timestampEnd,
        "date_start_ist":
            dateStartIst == null ? null : dateStartIst!.toIso8601String(),
        "date_end_ist":
            dateEndIst == null ? null : dateEndIst!.toIso8601String(),
        "venue": venue == null ? null : venue!.toJson(),
        "umpires": umpires == null ? null : umpires,
        "referee": referee == null ? null : referee,
        "equation": equation == null ? null : equation,
        "live": live == null ? null : live,
        "result": result == null ? null : result,
        "result_type": resultType == null ? null : resultType,
        "win_margin": winMargin == null ? null : winMargin,
        "winning_team_id": winningTeamId == null ? null : winningTeamId,
        "commentary": commentary == null ? null : commentary,
        "wagon": wagon == null ? null : wagon,
        "latest_inning_number":
            latestInningNumber == null ? null : latestInningNumber,
        "presquad_time":
            presquadTime == null ? null : presquadTime!.toIso8601String(),
        "verify_time": verifyTime == null ? null : verifyTime,
        "toss": toss == null ? null : toss!.toJson(),
        "current_over": currentOver == null ? null : currentOver,
        "previous_over": previousOver == null ? null : previousOver,
        "man_of_the_match": manOfTheMatch == null ? null : manOfTheMatch,
        "man_of_the_series": manOfTheSeries == null ? null : manOfTheSeries,
        "is_followon": isFollowon == null ? null : isFollowon,
        "team_batting_first":
            teamBattingFirst == null ? null : teamBattingFirst,
        "team_batting_second":
            teamBattingSecond == null ? null : teamBattingSecond,
        "last_five_overs": lastFiveOvers == null ? null : lastFiveOvers,
        "live_inning_number":
            liveInningNumber == null ? null : liveInningNumber,
        "innings": innings == null
            ? null
            : List<dynamic>.from(innings!.map((x) => x.toJson())),
        "players": players == null
            ? null
            : List<dynamic>.from(players!.map((x) => x.toJson())),
        "pre_match_odds": preMatchOdds == null
            ? null
            : List<dynamic>.from(preMatchOdds!.map((x) => x)),
      };
}

class Competition {
  Competition({
    this.cid,
    this.title,
    this.abbr,
    this.type,
    this.category,
    this.matchFormat,
    this.status,
    this.season,
    this.datestart,
    this.dateend,
    this.country,
    this.totalMatches,
    this.totalRounds,
    this.totalTeams,
  });

  int? cid;
  String? title;
  String? abbr;
  String? type;
  String? category;
  String? matchFormat;
  String? status;
  String? season;
  DateTime? datestart;
  DateTime? dateend;
  String? country;
  String? totalMatches;
  String? totalRounds;
  String? totalTeams;

  factory Competition.fromJson(Map<String?, dynamic> json) => Competition(
        cid: json["cid"] == null ? null : json["cid"],
        title: json["title"] == null ? null : json["title"],
        abbr: json["abbr"] == null ? null : json["abbr"],
        type: json["type"] == null ? null : json["type"],
        category: json["category"] == null ? null : json["category"],
        matchFormat: json["match_format"] == null ? null : json["match_format"],
        status: json["status"] == null ? null : json["status"],
        season: json["season"] == null ? null : json["season"],
        datestart: json["datestart"] == null
            ? null
            : DateTime.parse(json["datestart"]),
        dateend:
            json["dateend"] == null ? null : DateTime.parse(json["dateend"]),
        country: json["country"] == null ? null : json["country"],
        totalMatches:
            json["total_matches"] == null ? null : json["total_matches"],
        totalRounds: json["total_rounds"] == null ? null : json["total_rounds"],
        totalTeams: json["total_teams"] == null ? null : json["total_teams"],
      );

  Map<String?, dynamic> toJson() => {
        "cid": cid == null ? null : cid,
        "title": title == null ? null : title,
        "abbr": abbr == null ? null : abbr,
        "type": type == null ? null : type,
        "category": category == null ? null : category,
        "match_format": matchFormat == null ? null : matchFormat,
        "status": status == null ? null : status,
        "season": season == null ? null : season,
        "datestart": datestart == null
            ? null
            : "${datestart!.year.toString().padLeft(4, '0')}-${datestart!.month.toString().padLeft(2, '0')}-${datestart!.day.toString().padLeft(2, '0')}",
        "dateend": dateend == null
            ? null
            : "${dateend!.year.toString().padLeft(4, '0')}-${dateend!.month.toString().padLeft(2, '0')}-${dateend!.day.toString().padLeft(2, '0')}",
        "country": country == null ? null : country,
        "total_matches": totalMatches == null ? null : totalMatches,
        "total_rounds": totalRounds == null ? null : totalRounds,
        "total_teams": totalTeams == null ? null : totalTeams,
      };
}

class Inning {
  Inning({
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
    this.batsmen,
    this.bowlers,
    this.fielder,
    this.fows,
    this.lastWicket,
    this.extraRuns,
    this.equations,
    this.currentPartnership,
    this.didNotBat,
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
  List<InningBatsman>? batsmen;
  List<Bowler>? bowlers;
  List<Fielder>? fielder;
  List<LastWicket>? fows;
  LastWicket? lastWicket;
  ExtraRuns? extraRuns;
  Equations? equations;
  CurrentPartnership? currentPartnership;
  List<DidNotBat>? didNotBat;

  factory Inning.fromJson(Map<String?, dynamic> json) => Inning(
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
        batsmen: json["batsmen"] == null
            ? null
            : List<InningBatsman>.from(
                json["batsmen"].map((x) => InningBatsman.fromJson(x))),
        bowlers: json["bowlers"] == null
            ? null
            : List<Bowler>.from(json["bowlers"].map((x) => Bowler.fromJson(x))),
        fielder: json["fielder"] == null
            ? null
            : List<Fielder>.from(
                json["fielder"].map((x) => Fielder.fromJson(x))),
        fows: json["fows"] == null
            ? null
            : List<LastWicket>.from(
                json["fows"].map((x) => LastWicket.fromJson(x))),
        lastWicket: json["last_wicket"] == null
            ? null
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
      );

  Map<String?, dynamic> toJson() => {
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
        "batsmen": batsmen == null
            ? null
            : List<dynamic>.from(batsmen!.map((x) => x.toJson())),
        "bowlers": bowlers == null
            ? null
            : List<dynamic>.from(bowlers!.map((x) => x.toJson())),
        "fielder": fielder == null
            ? null
            : List<dynamic>.from(fielder!.map((x) => x.toJson())),
        "fows": fows == null
            ? null
            : List<dynamic>.from(fows!.map((x) => x.toJson())),
        "last_wicket": lastWicket == null ? null : lastWicket!.toJson(),
        "extra_runs": extraRuns == null ? null : extraRuns!.toJson(),
        "equations": equations == null ? null : equations!.toJson(),
        "current_partnership":
            currentPartnership == null ? null : currentPartnership!.toJson(),
        "did_not_bat": didNotBat == null
            ? null
            : List<dynamic>.from(didNotBat!.map((x) => x.toJson())),
      };
}

class InningBatsman {
  InningBatsman({
    this.name,
    this.batsmanId,
    this.batting,
    this.position,
    this.role,
    this.roleStr,
    this.runs,
    this.ballsFaced,
    this.fours,
    this.sixes,
    this.run0,
    this.run1,
    this.run2,
    this.run3,
    this.run5,
    this.howOut,
    this.dismissal,
    this.strikeRate,
    this.bowlerId,
    this.firstFielderId,
    this.secondFielderId,
    this.thirdFielderId,
  });

  String? name;
  String? batsmanId;
  String? batting;
  BatsmanPosition? position;
  Role? role;
  RoleStr? roleStr;
  String? runs;
  String? ballsFaced;
  String? fours;
  String? sixes;
  String? run0;
  String? run1;
  String? run2;
  String? run3;
  String? run5;
  String? howOut;
  Dismissal? dismissal;
  String? strikeRate;
  String? bowlerId;
  String? firstFielderId;
  String? secondFielderId;
  String? thirdFielderId;

  factory InningBatsman.fromJson(Map<String?, dynamic> json) => InningBatsman(
        name: json["name"] == null ? null : json["name"],
        batsmanId: json["batsman_id"] == null ? null : json["batsman_id"],
        batting: json["batting"] == null ? null : json["batting"],
        position: json["position"] == null
            ? null
            : batsmanPositionValues.map[json["position"]],
        role: json["role"] == null ? null : roleValues.map[json["role"]],
        roleStr: json["role_str"] == null
            ? null
            : roleStrValues.map[json["role_str"]],
        runs: json["runs"] == null ? null : json["runs"],
        ballsFaced: json["balls_faced"] == null ? null : json["balls_faced"],
        fours: json["fours"] == null ? null : json["fours"],
        sixes: json["sixes"] == null ? null : json["sixes"],
        run0: json["run0"] == null ? null : json["run0"],
        run1: json["run1"] == null ? null : json["run1"],
        run2: json["run2"] == null ? null : json["run2"],
        run3: json["run3"] == null ? null : json["run3"],
        run5: json["run5"] == null ? null : json["run5"],
        howOut: json["how_out"] == null ? null : json["how_out"],
        dismissal: json["dismissal"] == null
            ? null
            : dismissalValues.map[json["dismissal"]],
        strikeRate: json["strike_rate"] == null ? null : json["strike_rate"],
        bowlerId: json["bowler_id"] == null ? null : json["bowler_id"],
        firstFielderId:
            json["first_fielder_id"] == null ? null : json["first_fielder_id"],
        secondFielderId: json["second_fielder_id"] == null
            ? null
            : json["second_fielder_id"],
        thirdFielderId:
            json["third_fielder_id"] == null ? null : json["third_fielder_id"],
      );

  Map<String?, dynamic> toJson() => {
        "name": name == null ? null : name,
        "batsman_id": batsmanId == null ? null : batsmanId,
        "batting": batting == null ? null : batting,
        "position":
            position == null ? null : batsmanPositionValues.reverse[position],
        "role": role == null ? null : roleValues.reverse[role],
        "role_str": roleStr == null ? null : roleStrValues.reverse[roleStr],
        "runs": runs == null ? null : runs,
        "balls_faced": ballsFaced == null ? null : ballsFaced,
        "fours": fours == null ? null : fours,
        "sixes": sixes == null ? null : sixes,
        "run0": run0 == null ? null : run0,
        "run1": run1 == null ? null : run1,
        "run2": run2 == null ? null : run2,
        "run3": run3 == null ? null : run3,
        "run5": run5 == null ? null : run5,
        "how_out": howOut == null ? null : howOut,
        "dismissal":
            dismissal == null ? null : dismissalValues.reverse[dismissal],
        "strike_rate": strikeRate == null ? null : strikeRate,
        "bowler_id": bowlerId == null ? null : bowlerId,
        "first_fielder_id": firstFielderId == null ? null : firstFielderId,
        "second_fielder_id": secondFielderId == null ? null : secondFielderId,
        "third_fielder_id": thirdFielderId == null ? null : thirdFielderId,
      };
}

enum Dismissal { BOWLED, CAUGHT, EMPTY, LBW }

final dismissalValues = EnumValues({
  "bowled": Dismissal.BOWLED,
  "caught": Dismissal.CAUGHT,
  "": Dismissal.EMPTY,
  "lbw": Dismissal.LBW
});

enum BatsmanPosition { EMPTY, STRIKER, NON_STRIKER }

final batsmanPositionValues = EnumValues({
  "": BatsmanPosition.EMPTY,
  "non-striker": BatsmanPosition.NON_STRIKER,
  "striker": BatsmanPosition.STRIKER
});

enum Role { CAP, BAT, WK, ALL, BOWL, SQUAD }

final roleValues = EnumValues({
  "all": Role.ALL,
  "bat": Role.BAT,
  "bowl": Role.BOWL,
  "cap": Role.CAP,
  "squad": Role.SQUAD,
  "wk": Role.WK
});

enum RoleStr { C, EMPTY, WK }

final roleStrValues =
    EnumValues({" (C)": RoleStr.C, "": RoleStr.EMPTY, " (WK)": RoleStr.WK});

class Bowler {
  Bowler({
    this.name,
    this.bowlerId,
    this.bowling,
    this.position,
    this.overs,
    this.maidens,
    this.runsConceded,
    this.wickets,
    this.noballs,
    this.wides,
    this.econ,
    this.run0,
    this.bowledcount,
    this.lbwcount,
  });

  String? name;
  String? bowlerId;
  String? bowling;
  BowlerPosition? position;
  String? overs;
  String? maidens;
  String? runsConceded;
  String? wickets;
  String? noballs;
  String? wides;
  String? econ;
  String? run0;
  String? bowledcount;
  String? lbwcount;

  factory Bowler.fromJson(Map<String?, dynamic> json) => Bowler(
        name: json["name"] == null ? null : json["name"],
        bowlerId: json["bowler_id"] == null ? null : json["bowler_id"],
        bowling: json["bowling"] == null ? null : json["bowling"],
        position: json["position"] == null
            ? null
            : bowlerPositionValues.map[json["position"]],
        overs: json["overs"] == null ? null : json["overs"],
        maidens: json["maidens"] == null ? null : json["maidens"],
        runsConceded:
            json["runs_conceded"] == null ? null : json["runs_conceded"],
        wickets: json["wickets"] == null ? null : json["wickets"],
        noballs: json["noballs"] == null ? null : json["noballs"],
        wides: json["wides"] == null ? null : json["wides"],
        econ: json["econ"] == null ? null : json["econ"],
        run0: json["run0"] == null ? null : json["run0"],
        bowledcount: json["bowledcount"] == null ? null : json["bowledcount"],
        lbwcount: json["lbwcount"] == null ? null : json["lbwcount"],
      );

  Map<String?, dynamic> toJson() => {
        "name": name == null ? null : name,
        "bowler_id": bowlerId == null ? null : bowlerId,
        "bowling": bowling == null ? null : bowling,
        "position":
            position == null ? null : bowlerPositionValues.reverse[position],
        "overs": overs == null ? null : overs,
        "maidens": maidens == null ? null : maidens,
        "runs_conceded": runsConceded == null ? null : runsConceded,
        "wickets": wickets == null ? null : wickets,
        "noballs": noballs == null ? null : noballs,
        "wides": wides == null ? null : wides,
        "econ": econ == null ? null : econ,
        "run0": run0 == null ? null : run0,
        "bowledcount": bowledcount == null ? null : bowledcount,
        "lbwcount": lbwcount == null ? null : lbwcount,
      };
}

enum BowlerPosition { EMPTY, LAST_BOWLER, ACTIVE_BOWLER }

final bowlerPositionValues = EnumValues({
  "active bowler": BowlerPosition.ACTIVE_BOWLER,
  "": BowlerPosition.EMPTY,
  "last bowler": BowlerPosition.LAST_BOWLER
});

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

  factory CurrentPartnership.fromJson(Map<String?, dynamic> json) =>
      CurrentPartnership(
        runs: json["runs"] == null ? null : json["runs"],
        balls: json["balls"] == null ? null : json["balls"],
        overs: json["overs"] == null ? null : json["overs"].toDouble(),
        batsmen: json["batsmen"] == null
            ? null
            : List<CurrentPartnershipBatsman>.from(json["batsmen"]
                .map((x) => CurrentPartnershipBatsman.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
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
  int? batsmanId;
  int? runs;
  int? balls;

  factory CurrentPartnershipBatsman.fromJson(Map<String?, dynamic> json) =>
      CurrentPartnershipBatsman(
        name: json["name"] == null ? null : json["name"],
        batsmanId: json["batsman_id"] == null ? null : json["batsman_id"],
        runs: json["runs"] == null ? null : json["runs"],
        balls: json["balls"] == null ? null : json["balls"],
      );

  Map<String?, dynamic> toJson() => {
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

  factory DidNotBat.fromJson(Map<String?, dynamic> json) => DidNotBat(
        playerId: json["player_id"] == null ? null : json["player_id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String?, dynamic> toJson() => {
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

  factory Equations.fromJson(Map<String?, dynamic> json) => Equations(
        runs: json["runs"] == null ? null : json["runs"],
        wickets: json["wickets"] == null ? null : json["wickets"],
        overs: json["overs"] == null ? null : json["overs"],
        bowlersUsed: json["bowlers_used"] == null ? null : json["bowlers_used"],
        runrate: json["runrate"] == null ? null : json["runrate"],
      );

  Map<String?, dynamic> toJson() => {
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

  factory ExtraRuns.fromJson(Map<String?, dynamic> json) => ExtraRuns(
        byes: json["byes"] == null ? null : json["byes"],
        legbyes: json["legbyes"] == null ? null : json["legbyes"],
        wides: json["wides"] == null ? null : json["wides"],
        noballs: json["noballs"] == null ? null : json["noballs"],
        penalty: json["penalty"] == null ? null : json["penalty"],
        total: json["total"] == null ? null : json["total"],
      );

  Map<String?, dynamic> toJson() => {
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

  factory Fielder.fromJson(Map<String?, dynamic> json) => Fielder(
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

  Map<String?, dynamic> toJson() => {
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
  String? batsmanId;
  String? runs;
  String? balls;
  String? howOut;
  int? scoreAtDismissal;
  String? oversAtDismissal;
  String? bowlerId;
  Dismissal? dismissal;
  int? number;

  factory LastWicket.fromJson(Map<String?, dynamic> json) => LastWicket(
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
        dismissal: json["dismissal"] == null
            ? null
            : dismissalValues.map[json["dismissal"]],
        number: json["number"] == null ? null : json["number"],
      );

  Map<String?, dynamic> toJson() => {
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
        "dismissal":
            dismissal == null ? null : dismissalValues.reverse[dismissal],
        "number": number == null ? null : number,
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

  int? pid;
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
  Role? playingRole;
  BattingStyle? battingStyle;
  String? bowlingStyle;
  String? fieldingPosition;
  int? recentMatch;
  int? recentAppearance;
  double? fantasyPlayerRating;
  Name? nationality;
  Role? role;

  factory Player.fromJson(Map<String?, dynamic> json) => Player(
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
            : roleValues.map[json["playing_role"]],
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
            : nameValues.map[json["nationality"]],
        role: json["role"] == null ? null : roleValues.map[json["role"]],
      );

  Map<String?, dynamic> toJson() => {
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
            playingRole == null ? null : roleValues.reverse[playingRole],
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
            nationality == null ? null : nameValues.reverse[nationality],
        "role": role == null ? null : roleValues.reverse[role],
      };
}

enum BattingStyle { RIGHT_HAND_BAT, LEFT_HAND_BAT }

final battingStyleValues = EnumValues({
  "Left hand Bat": BattingStyle.LEFT_HAND_BAT,
  "Right Hand Bat": BattingStyle.RIGHT_HAND_BAT
});

enum Country { NZ, ZA }

final countryValues = EnumValues({"nz": Country.NZ, "za": Country.ZA});

enum Name { NEW_ZEALAND, SOUTH_AFRICA }

final nameValues = EnumValues(
    {"New Zealand": Name.NEW_ZEALAND, "South Africa": Name.SOUTH_AFRICA});

class Team {
  Team({
    this.teamId,
    this.name,
    this.shortName,
    this.logoUrl,
    this.thumbUrl,
    this.scoresFull,
    this.scores,
    this.overs,
  });

  int? teamId;
  Name? name;
  String? shortName;
  String? logoUrl;
  String? thumbUrl;
  String? scoresFull;
  String? scores;
  String? overs;

  factory Team.fromJson(Map<String?, dynamic> json) => Team(
        teamId: json["team_id"] == null ? null : json["team_id"],
        name: json["name"] == null ? null : nameValues.map[json["name"]],
        shortName: json["short_name"] == null ? null : json["short_name"],
        logoUrl: json["logo_url"] == null ? null : json["logo_url"],
        thumbUrl: json["thumb_url"] == null ? null : json["thumb_url"],
        scoresFull: json["scores_full"] == null ? null : json["scores_full"],
        scores: json["scores"] == null ? null : json["scores"],
        overs: json["overs"] == null ? null : json["overs"],
      );

  Map<String?, dynamic> toJson() => {
        "team_id": teamId == null ? null : teamId,
        "name": name == null ? null : nameValues.reverse[name],
        "short_name": shortName == null ? null : shortName,
        "logo_url": logoUrl == null ? null : logoUrl,
        "thumb_url": thumbUrl == null ? null : thumbUrl,
        "scores_full": scoresFull == null ? null : scoresFull,
        "scores": scores == null ? null : scores,
        "overs": overs == null ? null : overs,
      };
}

class Toss {
  Toss({
    this.text,
    this.winner,
    this.decision,
  });

  String? text;
  int? winner;
  int? decision;

  factory Toss.fromJson(Map<String?, dynamic> json) => Toss(
        text: json["text"] == null ? null : json["text"],
        winner: json["winner"] == null ? null : json["winner"],
        decision: json["decision"] == null ? null : json["decision"],
      );

  Map<String?, dynamic> toJson() => {
        "text": text == null ? null : text,
        "winner": winner == null ? null : winner,
        "decision": decision == null ? null : decision,
      };
}

class Venue {
  Venue({
    this.venueId,
    this.name,
    this.location,
    this.timezone,
  });

  String? venueId;
  String? name;
  String? location;
  String? timezone;

  factory Venue.fromJson(Map<String?, dynamic> json) => Venue(
        venueId: json["venue_id"] == null ? null : json["venue_id"],
        name: json["name"] == null ? null : json["name"],
        location: json["location"] == null ? null : json["location"],
        timezone: json["timezone"] == null ? null : json["timezone"],
      );

  Map<String?, dynamic> toJson() => {
        "venue_id": venueId == null ? null : venueId,
        "name": name == null ? null : name,
        "location": location == null ? null : location,
        "timezone": timezone == null ? null : timezone,
      };
}

class EnumValues<T> {
  Map<String?, T> map;
  Map<T, String?>? reverseMap;

  EnumValues(this.map);

  Map<T, String?> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
