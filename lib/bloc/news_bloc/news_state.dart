import 'package:equatable/equatable.dart';
import 'package:ny_news/core/utils/enums.dart';
import 'package:ny_news/data/models/article_model.dart';

class NewsState extends Equatable {
  final List<ArticleModel> newsModel;
  final RequestStatus status;
  final String message;

  const NewsState({
    this.newsModel = const [],
    this.status = RequestStatus.loading,
    this.message = '',
  });

  NewsState copyWith({
    List<ArticleModel>? newsModel,
    RequestStatus? status,
    String? message,
  }) {
    return NewsState(
      newsModel: newsModel ?? this.newsModel,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        newsModel,
        status,
        message,
      ];
}
