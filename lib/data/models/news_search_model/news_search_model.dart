import 'package:json_annotation/json_annotation.dart';
part 'news_search_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NewsSearchModel {
  String? docAbstract;
  String? webUrl;
  String? snippet;
  String? leadParagraph;
  String? pubDate;
  String? newsDesk;
  String? sectionName;
  String? subsectionName;
  String? id;
  int? wordCount;
  String? uri;
  String? printSection;
  String? printPage;

  NewsSearchModel({
    this.docAbstract,
    this.webUrl,
    this.snippet,
    this.leadParagraph,
    this.pubDate,
    this.newsDesk,
    this.sectionName,
    this.subsectionName,
    this.id,
    this.wordCount,
    this.uri,
    this.printSection,
    this.printPage,
  });

  factory NewsSearchModel.fromJson(json) => _$NewsSearchModelFromJson(json);

  toJson() => _$NewsSearchModelToJson(this);

  static List<NewsSearchModel> fromJsonList(List json) {
    return json.map((e) => NewsSearchModel.fromJson(e)).toList();
  }
}
