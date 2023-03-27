// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

MessageModel welcomeFromJson(String str) => MessageModel.fromJson(json.decode(str));

String welcomeToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
  MessageModel({
    this.id,
    this.date,
    this.dateGmt,
    this.guid,
    this.modified,
    this.modifiedGmt,
    this.slug,
    this.status,
    this.type,
    this.link,
    this.title,
    this.content,
    this.excerpt,
    this.author,
    this.featuredMedia,
    this.commentStatus,
    this.pingStatus,
    this.sticky,
    this.template,
    this.format,
    this.meta,
    this.categories,
    this.tags,
    this.links,
  });

  int? id;
  DateTime? date;
  DateTime? dateGmt;
  Guid? guid;
  DateTime? modified;
  DateTime? modifiedGmt;
  String? slug;
  String? status;
  String? type;
  String? link;
  Guid? title;
  Content? content;
  Content? excerpt;
  int? author;
  int? featuredMedia;
  String? commentStatus;
  String? pingStatus;
  bool? sticky;
  String? template;
  String? format;
  List<dynamic>? meta;
  List<int>? categories;
  List<dynamic>? tags;
  Links? links;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    id: json["id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    dateGmt: json["date_gmt"] == null ? null : DateTime.parse(json["date_gmt"]),
    guid: json["guid"] == null ? null : Guid.fromJson(json["guid"]),
    modified: json["modified"] == null ? null : DateTime.parse(json["modified"]),
    modifiedGmt: json["modified_gmt"] == null ? null : DateTime.parse(json["modified_gmt"]),
    slug: json["slug"],
    status: json["status"],
    type: json["type"],
    link: json["link"],
    title: json["title"] == null ? null : Guid.fromJson(json["title"]),
    content: json["content"] == null ? null : Content.fromJson(json["content"]),
    excerpt: json["excerpt"] == null ? null : Content.fromJson(json["excerpt"]),
    author: json["author"],
    featuredMedia: json["featured_media"],
    commentStatus: json["comment_status"],
    pingStatus: json["ping_status"],
    sticky: json["sticky"],
    template: json["template"],
    format: json["format"],
    meta: json["meta"] == null ? [] : List<dynamic>.from(json["meta"]!.map((x) => x)),
    categories: json["categories"] == null ? [] : List<int>.from(json["categories"]!.map((x) => x)),
    tags: json["tags"] == null ? [] : List<dynamic>.from(json["tags"]!.map((x) => x)),
    links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date?.toIso8601String(),
    "date_gmt": dateGmt?.toIso8601String(),
    "guid": guid?.toJson(),
    "modified": modified?.toIso8601String(),
    "modified_gmt": modifiedGmt?.toIso8601String(),
    "slug": slug,
    "status": status,
    "type": type,
    "link": link,
    "title": title?.toJson(),
    "content": content?.toJson(),
    "excerpt": excerpt?.toJson(),
    "author": author,
    "featured_media": featuredMedia,
    "comment_status": commentStatus,
    "ping_status": pingStatus,
    "sticky": sticky,
    "template": template,
    "format": format,
    "meta": meta == null ? [] : List<dynamic>.from(meta!.map((x) => x)),
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
    "_links": links?.toJson(),
  };
}

class Content {
  Content({
    this.rendered,
    this.protected,
  });

  String? rendered;
  bool? protected;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    rendered: json["rendered"],
    protected: json["protected"],
  );

  Map<String, dynamic> toJson() => {
    "rendered": rendered,
    "protected": protected,
  };
}

class Guid {
  Guid({
    this.rendered,
  });

  String? rendered;

  factory Guid.fromJson(Map<String, dynamic> json) => Guid(
    rendered: json["rendered"],
  );

  Map<String, dynamic> toJson() => {
    "rendered": rendered,
  };
}

class Links {
  Links({
    this.self,
    this.collection,
    this.about,
    this.author,
    this.replies,
    this.versionHistory,
    this.predecessorVersion,
    this.wpFeaturedmedia,
    this.wpAttachment,
    this.wpTerm,
    this.curies,
  });

  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<Author>? author;
  List<Author>? replies;
  List<VersionHistory>? versionHistory;
  List<PredecessorVersion>? predecessorVersion;
  List<Author>? wpFeaturedmedia;
  List<About>? wpAttachment;
  List<WpTerm>? wpTerm;
  List<Cury>? curies;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: json["self"] == null ? [] : List<About>.from(json["self"]!.map((x) => About.fromJson(x))),
    collection: json["collection"] == null ? [] : List<About>.from(json["collection"]!.map((x) => About.fromJson(x))),
    about: json["about"] == null ? [] : List<About>.from(json["about"]!.map((x) => About.fromJson(x))),
    author: json["author"] == null ? [] : List<Author>.from(json["author"]!.map((x) => Author.fromJson(x))),
    replies: json["replies"] == null ? [] : List<Author>.from(json["replies"]!.map((x) => Author.fromJson(x))),
    versionHistory: json["version-history"] == null ? [] : List<VersionHistory>.from(json["version-history"]!.map((x) => VersionHistory.fromJson(x))),
    predecessorVersion: json["predecessor-version"] == null ? [] : List<PredecessorVersion>.from(json["predecessor-version"]!.map((x) => PredecessorVersion.fromJson(x))),
    wpFeaturedmedia: json["wp:featuredmedia"] == null ? [] : List<Author>.from(json["wp:featuredmedia"]!.map((x) => Author.fromJson(x))),
    wpAttachment: json["wp:attachment"] == null ? [] : List<About>.from(json["wp:attachment"]!.map((x) => About.fromJson(x))),
    wpTerm: json["wp:term"] == null ? [] : List<WpTerm>.from(json["wp:term"]!.map((x) => WpTerm.fromJson(x))),
    curies: json["curies"] == null ? [] : List<Cury>.from(json["curies"]!.map((x) => Cury.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": self == null ? [] : List<dynamic>.from(self!.map((x) => x.toJson())),
    "collection": collection == null ? [] : List<dynamic>.from(collection!.map((x) => x.toJson())),
    "about": about == null ? [] : List<dynamic>.from(about!.map((x) => x.toJson())),
    "author": author == null ? [] : List<dynamic>.from(author!.map((x) => x.toJson())),
    "replies": replies == null ? [] : List<dynamic>.from(replies!.map((x) => x.toJson())),
    "version-history": versionHistory == null ? [] : List<dynamic>.from(versionHistory!.map((x) => x.toJson())),
    "predecessor-version": predecessorVersion == null ? [] : List<dynamic>.from(predecessorVersion!.map((x) => x.toJson())),
    "wp:featuredmedia": wpFeaturedmedia == null ? [] : List<dynamic>.from(wpFeaturedmedia!.map((x) => x.toJson())),
    "wp:attachment": wpAttachment == null ? [] : List<dynamic>.from(wpAttachment!.map((x) => x.toJson())),
    "wp:term": wpTerm == null ? [] : List<dynamic>.from(wpTerm!.map((x) => x.toJson())),
    "curies": curies == null ? [] : List<dynamic>.from(curies!.map((x) => x.toJson())),
  };
}

class About {
  About({
    this.href,
  });

  String? href;

  factory About.fromJson(Map<String, dynamic> json) => About(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}

class Author {
  Author({
    this.embeddable,
    this.href,
  });

  bool? embeddable;
  String? href;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    embeddable: json["embeddable"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "embeddable": embeddable,
    "href": href,
  };
}

class Cury {
  Cury({
    this.name,
    this.href,
    this.templated,
  });

  String? name;
  String? href;
  bool? templated;

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
    name: json["name"],
    href: json["href"],
    templated: json["templated"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "href": href,
    "templated": templated,
  };
}

class PredecessorVersion {
  PredecessorVersion({
    this.id,
    this.href,
  });

  int? id;
  String? href;

  factory PredecessorVersion.fromJson(Map<String, dynamic> json) => PredecessorVersion(
    id: json["id"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "href": href,
  };
}

class VersionHistory {
  VersionHistory({
    this.count,
    this.href,
  });

  int? count;
  String? href;

  factory VersionHistory.fromJson(Map<String, dynamic> json) => VersionHistory(
    count: json["count"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "href": href,
  };
}

class WpTerm {
  WpTerm({
    this.taxonomy,
    this.embeddable,
    this.href,
  });

  String? taxonomy;
  bool? embeddable;
  String? href;

  factory WpTerm.fromJson(Map<String, dynamic> json) => WpTerm(
    taxonomy: json["taxonomy"],
    embeddable: json["embeddable"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "taxonomy": taxonomy,
    "embeddable": embeddable,
    "href": href,
  };
}
