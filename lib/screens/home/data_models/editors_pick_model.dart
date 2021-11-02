// To parse this JSON data, do
//
//     final EditorsPickModel = EditorsPickModelFromJson(jsonString);

import 'dart:convert';

EditorsPickModel EditorsPickModelFromJson(String str) => EditorsPickModel.fromJson(json.decode(str));

String EditorsPickModelToJson(EditorsPickModel data) => json.encode(data.toJson());

class EditorsPickModel {
  EditorsPickModel({
    this.data,
    this.links,
    this.meta,
  });

  List<Datum>? data;
  Links? links;
  Meta? meta;

  factory EditorsPickModel.fromJson(Map<String, dynamic> json) => EditorsPickModel(
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    "links": links == null ? null : links!.toJson(),
    "meta": meta == null ? null : meta!.toJson(),
  };
}

class Datum {
  Datum({
    this.title,
    this.slug,
    this.category,
    this.image,
    this.date,
    this.photoCredit,
    this.reporter,
    this.exclusive,
    this.exclusiveEnd,
  });

  String? title;
  String? slug;
  List<Category>? category;
  String? image;
  String? date;
  PhotoCredit? photoCredit;
  Reporter? reporter;
  bool? exclusive;
  dynamic exclusiveEnd;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    title: json["title"] == null ? null : json["title"],
    slug: json["slug"] == null ? null : json["slug"],
    category: json["category"] == null ? null : List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    image: json["image"] == null ? null : json["image"],
    date: json["date"] == null ? null : json["date"],
    photoCredit: json["photo_credit"] == null ? null : photoCreditValues.map[json["photo_credit"]],
    reporter: json["reporter"] == null ? null : reporterValues.map[json["reporter"]],
    exclusive: json["exclusive"] == null ? null : json["exclusive"],
    exclusiveEnd: json["exclusive_end"],
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "slug": slug == null ? null : slug,
    "category": category == null ? null : List<dynamic>.from(category!.map((x) => x.toJson())),
    "image": image == null ? null : image,
    "date": date == null ? null : date,
    "photo_credit": photoCredit == null ? null : photoCreditValues.reverse![photoCredit],
    "reporter": reporter == null ? null : reporterValues.reverse![reporter],
    "exclusive": exclusive == null ? null : exclusive,
    "exclusive_end": exclusiveEnd,
  };
}

class Category {
  Category({
    this.id,
    this.name,
    this.slug,
    this.featured,
  });

  int? id;
  Name? name;
  Slug? slug;
  bool? featured;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : nameValues.map[json["name"]],
    slug: json["slug"] == null ? null : slugValues.map[json["slug"]],
    featured: json["featured"] == null ? null : json["featured"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : nameValues.reverse![name],
    "slug": slug == null ? null : slugValues.reverse![slug],
    "featured": featured == null ? null : featured,
  };
}

enum Name { INTERNATIONAL_CRICKET, ICCT20_WORLD_CUP2021, ICC_CRICKET_WORLD_CUP_2019 }

final nameValues = EnumValues({
  "ICCT20 World Cup2021": Name.ICCT20_WORLD_CUP2021,
  "ICC Cricket World Cup 2019": Name.ICC_CRICKET_WORLD_CUP_2019,
  "International Cricket": Name.INTERNATIONAL_CRICKET
});

enum Slug { INTERNATIONAL_CRICKET, ICCT20_WORLD_CUP2021, ICC_CRICKET_WORLD_CUP_2019 }

final slugValues = EnumValues({
  "icct20-world-cup2021": Slug.ICCT20_WORLD_CUP2021,
  "icc-cricket-world-cup-2019": Slug.ICC_CRICKET_WORLD_CUP_2019,
  "international-cricket": Slug.INTERNATIONAL_CRICKET
});

enum PhotoCredit { ONLINE }

final photoCreditValues = EnumValues({
  "Online": PhotoCredit.ONLINE
});

enum Reporter { STAFF_CORRESPONDENT }

final reporterValues = EnumValues({
  "Staff Correspondent": Reporter.STAFF_CORRESPONDENT
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
