import 'package:dio/dio.dart';
import 'package:ny_news/core/network/api_constants.dart';
import 'package:ny_news/data/models/article_model.dart';
import '../../core/error/exceptions.dart';
import '../../core/network/error_message_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<ArticleModel>> getNewsDataArticle();
}

class NewsRemoteDataSourceImpl extends NewsRemoteDataSource {
  final Dio dio;

  NewsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ArticleModel>> getNewsDataArticle() async {
    final response = await dio.get(ApiConstants.mostPopularData);
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
}
