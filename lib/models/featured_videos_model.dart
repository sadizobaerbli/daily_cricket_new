// To parse this JSON data, do
//
//     final featuredVideosModel = featuredVideosModelFromJson(jsonString);

import 'dart:convert';

FeaturedVideosModel featuredVideosModelFromJson(String str) =>
    FeaturedVideosModel.fromJson(json.decode(str));

String featuredVideosModelToJson(FeaturedVideosModel data) =>
    json.encode(data.toJson());

class FeaturedVideosModel {
  FeaturedVideosModel({
    this.data,
    this.links,
    this.meta,
  });

  List<Datum>? data;
  Links? links;
  Meta? meta;

  factory FeaturedVideosModel.fromJson(Map<String, dynamic> json) =>
      FeaturedVideosModel(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links == null ? null : links!.toJson(),
        "meta": meta == null ? null : meta!.toJson(),
      };
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.url,
    this.userId,
    this.seriesId,
    this.date,
    this.time,
    this.videoCategoryId,
    this.createdAt,
    this.category,
  });

  int? id;
  String? title;
  String? url;
  int? userId;
  int? seriesId;
  DateTime? date;
  String? time;
  int? videoCategoryId;
  String? createdAt;
  Category? category;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        url: json["url"] == null ? null : json["url"],
        userId: json["user_id"] == null ? null : json["user_id"],
        seriesId: json["series_id"] == null ? null : json["series_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        time: json["time"] == null ? null : json["time"],
        videoCategoryId: json["video_category_id"] == null
            ? null
            : json["video_category_id"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "url": url == null ? null : url,
        "user_id": userId == null ? null : userId,
        "series_id": seriesId == null ? null : seriesId,
        "date": date == null
            ? null
            : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "time": time == null ? null : time,
        "video_category_id": videoCategoryId == null ? null : videoCategoryId,
        "created_at": createdAt == null ? null : createdAt,
        "category": category == null ? null : category!.toJson(),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.slug,
  });

  int? id;
  Name? name;
  Slug? slug;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : nameValues.map[json["name"]],
        slug: json["slug"] == null ? null : slugValues.map[json["slug"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : nameValues.reverse![name],
        "slug": slug == null ? null : slugValues.reverse![slug],
      };
}

enum Name { IPL_2021, THE_DAILY_CRICKET_SHOW, DAILY_CRICKET_BULLETIN }

final nameValues = EnumValues({
  "DailyCricket Bulletin": Name.DAILY_CRICKET_BULLETIN,
  "IPL 2021": Name.IPL_2021,
  "The DailyCricket Show": Name.THE_DAILY_CRICKET_SHOW
});

enum Slug { IPL_2021, THE_DAILYCRICKET_SHOW, DAILYCRICKET_BULLETIN }

final slugValues = EnumValues({
  "dailycricket-bulletin": Slug.DAILYCRICKET_BULLETIN,
  "ipl-2021": Slug.IPL_2021,
  "the-dailycricket-show": Slug.THE_DAILYCRICKET_SHOW
});

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String? first;
  String? last;
  dynamic prev;
  String? next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"] == null ? null : json["first"],
        last: json["last"] == null ? null : json["last"],
        prev: json["prev"],
        next: json["next"] == null ? null : json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first == null ? null : first,
        "last": last == null ? null : last,
        "prev": prev,
        "next": next == null ? null : next,
      };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int? currentPage;
  int? from;
  int? lastPage;
  String? path;
  int? perPage;
  int? to;
  int? total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"] == null ? null : json["current_page"],
        from: json["from"] == null ? null : json["from"],
        lastPage: json["last_page"] == null ? null : json["last_page"],
        path: json["path"] == null ? null : json["path"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        to: json["to"] == null ? null : json["to"],
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage == null ? null : currentPage,
        "from": from == null ? null : from,
        "last_page": lastPage == null ? null : lastPage,
        "path": path == null ? null : path,
        "per_page": perPage == null ? null : perPage,
        "to": to == null ? null : to,
        "total": total == null ? null : total,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
