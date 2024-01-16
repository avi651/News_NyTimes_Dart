// import 'package:equatable/equatable.dart';

// class NewsModel extends Equatable {
//   const NewsModel({
//     required this.status,
//     required this.copyright,
//     required this.numResults,
//     required this.results,
//   });

//   final String? status;
//   final String? copyright;
//   final int? numResults;
//   final List<Result> results;

//   factory NewsModel.fromJson(Map<String, dynamic> json) {
//     return NewsModel(
//       status: json["status"],
//       copyright: json["copyright"],
//       numResults: json["num_results"],
//       results: json["results"] == null
//           ? []
//           : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
//     );
//   }

//   @override
//   List<Object?> get props => [
//         status,
//         copyright,
//         numResults,
//         results,
//       ];
// }

// class Result extends Equatable {
//   const Result({
//     this.uri,
//     this.url,
//     this.id,
//     this.assetId,
//     this.source,
//     this.publishedDate,
//     this.updated,
//     this.section,
//     this.nytdsection,
//     this.adxKeywords,
//     this.byline,
//     this.type,
//     this.title,
//     this.resultAbstract,
//     this.etaId,
//   });

//   final String? uri;
//   final String? url;
//   final int? id;
//   final int? assetId;
//   final String? source;
//   final String? publishedDate;
//   final String? updated;
//   final String? section;
//   final String? nytdsection;
//   final String? adxKeywords;
//   final String? byline;
//   final String? type;
//   final String? title;
//   final String? resultAbstract;

//   final int? etaId;

//   factory Result.fromJson(Map<String, dynamic> json) {
//     return Result(
//       uri: json["uri"],
//       url: json["url"],
//       id: json["id"],
//       assetId: json["asset_id"],
//       source: json["source"],
//       publishedDate: json["published_date"],
//       updated: json["updated"],
//       section: json["section"],
//       nytdsection: json["nytdsection"],
//       adxKeywords: json["adx_keywords"],
//       byline: json["byline"],
//       type: json["type"],
//       title: json["title"],
//       resultAbstract: json["abstract"],
//       etaId: json["eta_id"],
//     );
//   }

//   @override
//   List<Object?> get props => [
//         uri,
//         url,
//         id,
//         assetId,
//         source,
//         publishedDate,
//         updated,
//         section,
//         nytdsection,
//         adxKeywords,
//         byline,
//         type,
//         title,
//         resultAbstract,
//         etaId,
//       ];
// }
