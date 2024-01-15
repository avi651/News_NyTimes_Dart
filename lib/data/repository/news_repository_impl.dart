import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ny_news/core/error/exceptions.dart';
import 'package:ny_news/core/error/failure.dart';
import 'package:ny_news/data/models/news_model.dart';
import '../../domain/repository/news_repository.dart';
import '../datasource/news_remote_data_source.dart';

class NewsRepositoryImpl extends NewsRespository {
  final NewsRemoteDataSource newsRemoteDataSource;

  NewsRepositoryImpl(this.newsRemoteDataSource);

  @override
  Future<Either<Failure, List<Result>>> getNewsData() async {
    try {
      final result = await newsRemoteDataSource.getNewsDataArticle();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioError catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }
}
