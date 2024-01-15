import 'package:equatable/equatable.dart';

class NewsModel extends Equatable {
  const NewsModel({
    required this.status,
    required this.copyright,
    required this.numResults,
    required this.results,
  });

  final String? status;
  final String? copyright;
  final int? numResults;
  final List<Result> results;

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      status: json["status"],
      copyright: json["copyright"],
      numResults: json["num_results"],
      results: json["results"] == null
          ? []
          : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [
        status,
        copyright,
        numResults,
        results,
      ];
}

class Result extends Equatable {
  const Result({
    required this.uri,
    required this.url,
    required this.id,
    required this.assetId,
    required this.source,
    required this.publishedDate,
    required this.updated,
    required this.section,
    required this.subsection,
    required this.nytdsection,
    required this.adxKeywords,
    required this.column,
    required this.byline,
    required this.type,
    required this.title,
    required this.resultAbstract,
    required this.desFacet,
    required this.orgFacet,
    required this.perFacet,
    required this.geoFacet,
    required this.media,
    required this.etaId,
  });

  final String? uri;
  final String? url;
  final int? id;
  final int? assetId;
  final String? source;
  final DateTime? publishedDate;
  final DateTime? updated;
  final String? section;
  final String? subsection;
  final String? nytdsection;
  final String? adxKeywords;
  final dynamic column;
  final String? byline;
  final String? type;
  final String? title;
  final String? resultAbstract;
  final List<String> desFacet;
  final List<String> orgFacet;
  final List<String> perFacet;
  final List<String> geoFacet;
  final List<Media> media;
  final int? etaId;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      uri: json["uri"],
      url: json["url"],
      id: json["id"],
      assetId: json["asset_id"],
      source: json["source"],
      publishedDate: DateTime.tryParse(json["published_date"] ?? ""),
      updated: DateTime.tryParse(json["updated"] ?? ""),
      section: json["section"],
      subsection: json["subsection"],
      nytdsection: json["nytdsection"],
      adxKeywords: json["adx_keywords"],
      column: json["column"],
      byline: json["byline"],
      type: json["type"],
      title: json["title"],
      resultAbstract: json["abstract"],
      desFacet: json["des_facet"] == null
          ? []
          : List<String>.from(json["des_facet"]!.map((x) => x)),
      orgFacet: json["org_facet"] == null
          ? []
          : List<String>.from(json["org_facet"]!.map((x) => x)),
      perFacet: json["per_facet"] == null
          ? []
          : List<String>.from(json["per_facet"]!.map((x) => x)),
      geoFacet: json["geo_facet"] == null
          ? []
          : List<String>.from(json["geo_facet"]!.map((x) => x)),
      media: json["media"] == null
          ? []
          : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
      etaId: json["eta_id"],
    );
  }

  @override
  List<Object?> get props => [
        uri,
        url,
        id,
        assetId,
        source,
        publishedDate,
        updated,
        section,
        subsection,
        nytdsection,
        adxKeywords,
        column,
        byline,
        type,
        title,
        resultAbstract,
        desFacet,
        orgFacet,
        perFacet,
        geoFacet,
        media,
        etaId,
      ];
}

class Media extends Equatable {
  const Media({
    required this.type,
    required this.subtype,
    required this.caption,
    required this.copyright,
    required this.approvedForSyndication,
    required this.mediaMetadata,
  });

  final String? type;
  final String? subtype;
  final String? caption;
  final String? copyright;
  final int? approvedForSyndication;
  final List<MediaMetadatum> mediaMetadata;

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      type: json["type"],
      subtype: json["subtype"],
      caption: json["caption"],
      copyright: json["copyright"],
      approvedForSyndication: json["approved_for_syndication"],
      mediaMetadata: json["media-metadata"] == null
          ? []
          : List<MediaMetadatum>.from(
              json["media-metadata"]!.map((x) => MediaMetadatum.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [
        type,
        subtype,
        caption,
        copyright,
        approvedForSyndication,
        mediaMetadata,
      ];
}

class MediaMetadatum extends Equatable {
  const MediaMetadatum({
    required this.url,
    required this.format,
    required this.height,
    required this.width,
  });

  final String? url;
  final String? format;
  final int? height;
  final int? width;

  factory MediaMetadatum.fromJson(Map<String, dynamic> json) {
    return MediaMetadatum(
      url: json["url"],
      format: json["format"],
      height: json["height"],
      width: json["width"],
    );
  }

  @override
  List<Object?> get props => [
        url,
        format,
        height,
        width,
      ];
}
