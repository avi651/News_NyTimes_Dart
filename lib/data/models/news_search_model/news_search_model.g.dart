// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsSearchModel _$NewsSearchModelFromJson(Map<String, dynamic> json) =>
    NewsSearchModel(
      docAbstract: json['doc_abstract'] as String?,
      webUrl: json['web_url'] as String?,
      snippet: json['snippet'] as String?,
      leadParagraph: json['lead_paragraph'] as String?,
      pubDate: json['pub_date'] as String?,
      newsDesk: json['news_desk'] as String?,
      sectionName: json['section_name'] as String?,
      subsectionName: json['subsection_name'] as String?,
      id: json['id'] as String?,
      wordCount: json['word_count'] as int?,
      uri: json['uri'] as String?,
      printSection: json['print_section'] as String?,
      printPage: json['print_page'] as String?,
    );

Map<String, dynamic> _$NewsSearchModelToJson(NewsSearchModel instance) =>
    <String, dynamic>{
      'doc_abstract': instance.docAbstract,
      'web_url': instance.webUrl,
      'snippet': instance.snippet,
      'lead_paragraph': instance.leadParagraph,
      'pub_date': instance.pubDate,
      'news_desk': instance.newsDesk,
      'section_name': instance.sectionName,
      'subsection_name': instance.subsectionName,
      'id': instance.id,
      'word_count': instance.wordCount,
      'uri': instance.uri,
      'print_section': instance.printSection,
      'print_page': instance.printPage,
    };
