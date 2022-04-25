// To parse this JSON data, do
//
//     final liveMatchsDataModel = liveMatchsDataModelFromJson(jsonString);

import 'dart:convert';

LiveMatchesDataModel liveMatchesDataModelFromJson(String str) =>
    LiveMatchesDataModel.fromJson(json.decode(str));

String liveMatchesDataModelToJson(LiveMatchesDataModel data) =>
    json.encode(data.toJson());

class LiveMatchesDataModel {
  LiveMatchesDataModel({
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

  factory LiveMatchesDataModel.fromJson(Map<String, dynamic> json) =>
      LiveMatchesDataModel(
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
    this.items,
    this.totalItems,
    this.totalPages,
  });

  List<Item>? items;
  int? totalItems;
  int? totalPages;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        totalItems: json["total_items"] == null ? null : json["total_items"],
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "total_items": totalItems == null ? null : totalItems,
        "total_pages": totalPages == null ? null : totalPages,
      };
}

class Item {
  Item({
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
    this.domestic,
    this.competition,
    this.teama,
    this.teamb,
    this.dateStart,
    this.dateEnd,
    this.timestampStart,
    this.timestampEnd,
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
    this.toss,
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
  String? domestic;
  Competition? competition;
  Team? teama;
  Team? teamb;
  DateTime? dateStart;
  DateTime? dateEnd;
  int? timestampStart;
  int? timestampEnd;
  Venue? venue;
  String? umpires;
  String? referee;
  String? equation;
  String? live;
  String? result;
  dynamic resultType;
  String? winMargin;
  int? winningTeamId;
  int? commentary;
  int? wagon;
  int? latestInningNumber;
  Toss? toss;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
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
        domestic: json["domestic"] == null ? null : json["domestic"],
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
        toss: json["toss"] == null ? null : Toss.fromJson(json["toss"]),
      );

  Map<String, dynamic> toJson() => {
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
        "domestic": domestic == null ? null : domestic,
        "competition": competition == null ? null : competition!.toJson(),
        "teama": teama == null ? null : teama!.toJson(),
        "teamb": teamb == null ? null : teamb!.toJson(),
        "date_start": dateStart == null ? null : dateStart!.toIso8601String(),
        "date_end": dateEnd == null ? null : dateEnd!.toIso8601String(),
        "timestamp_start": timestampStart == null ? null : timestampStart,
        "timestamp_end": timestampEnd == null ? null : timestampEnd,
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
        "toss": toss == null ? null : toss!.toJson(),
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
    this.totalMatches,
    this.totalRounds,
    this.totalTeams,
    this.country,
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
  String? totalMatches;
  String? totalRounds;
  String? totalTeams;
  String? country;

  factory Competition.fromJson(Map<String, dynamic> json) => Competition(
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
        totalMatches:
            json["total_matches"] == null ? null : json["total_matches"],
        totalRounds: json["total_rounds"] == null ? null : json["total_rounds"],
        totalTeams: json["total_teams"] == null ? null : json["total_teams"],
        country: json["country"] == null ? null : json["country"],
      );

  Map<String, dynamic> toJson() => {
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
        "total_matches": totalMatches == null ? null : totalMatches,
        "total_rounds": totalRounds == null ? null : totalRounds,
        "total_teams": totalTeams == null ? null : totalTeams,
        "country": country == null ? null : country,
      };
}

class Team {
  Team({
    this.teamId,
    this.name,
    this.shortName,
    this.logoUrl,
    this.scoresFull,
    this.scores,
    this.overs,
  });

  int? teamId;
  String? name;
  String? shortName;
  String? logoUrl;
  String? scoresFull;
  String? scores;
  String? overs;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        teamId: json["team_id"] == null ? null : json["team_id"],
        name: json["name"] == null ? null : json["name"],
        shortName: json["short_name"] == null ? null : json["short_name"],
        logoUrl: json["logo_url"] == null ? null : json["logo_url"],
        scoresFull: json["scores_full"] == null ? null : json["scores_full"],
        scores: json["scores"] == null ? null : json["scores"],
        overs: json["overs"] == null ? null : json["overs"],
      );

  Map<String, dynamic> toJson() => {
        "team_id": teamId == null ? null : teamId,
        "name": name == null ? null : name,
        "short_name": shortName == null ? null : shortName,
        "logo_url": logoUrl == null ? null : logoUrl,
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

  factory Toss.fromJson(Map<String, dynamic> json) => Toss(
        text: json["text"] == null ? null : json["text"],
        winner: json["winner"] == null ? null : json["winner"],
        decision: json["decision"] == null ? null : json["decision"],
      );

  Map<String, dynamic> toJson() => {
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

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        venueId: json["venue_id"] == null ? null : json["venue_id"],
        name: json["name"] == null ? null : json["name"],
        location: json["location"] == null ? null : json["location"],
        timezone: json["timezone"] == null ? null : json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "venue_id": venueId == null ? null : venueId,
        "name": name == null ? null : name,
        "location": location == null ? null : location,
        "timezone": timezone == null ? null : timezone,
      };
}
