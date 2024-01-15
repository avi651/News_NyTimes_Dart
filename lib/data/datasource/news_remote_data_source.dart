import 'package:dio/dio.dart';
import 'package:ny_news/core/network/api_constants.dart';
import 'package:ny_news/data/models/news_model.dart';
import '../../core/error/exceptions.dart';
import '../../core/network/error_message_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<Result>> getNewsDataArticle();
}

class NewsRemoteDataSourceImpl extends NewsRemoteDataSource {
  @override
  Future<List<Result>> getNewsDataArticle() async {
    final response = await Dio().get(ApiConstants.mostPopularData);
    if (response.statusCode == 200) {
      //return response.data;
      return List<Result>.from(
          (response.data['results'] as List).map((e) => Result.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
