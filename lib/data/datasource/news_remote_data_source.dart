import 'package:dio/dio.dart';
import 'package:ny_news/core/network/api_constants.dart';
import 'package:ny_news/data/models/article_model.dart';
import 'package:ny_news/data/models/news_search_model/news_search_model.dart';
import '../../core/error/exceptions.dart';
import '../../core/network/error_message_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<ArticleModel>> getNewsDataArticle();
  Future<List<NewsSearchModel>> getNewsSearchData(String searchNews);
}

class NewsRemoteDataSourceImpl extends NewsRemoteDataSource {
  NewsRemoteDataSourceImpl();

  @override
  Future<List<ArticleModel>> getNewsDataArticle() async {
    final response = await Dio().get(ApiConstants.mostPopularData);
    if (response.statusCode == 200) {
      //return response.data;
      return List<ArticleModel>.from((response.data['results'] as List)
          .map((e) => ArticleModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<NewsSearchModel>> getNewsSearchData(String searchNews) async {
    final response = await Dio().get(ApiConstants.getAllSearchNews(searchNews));
    if (response.statusCode == 200) {
      //return response.data;
      return List<NewsSearchModel>.from((response.data['docs'] as List)
          .map((e) => NewsSearchModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
