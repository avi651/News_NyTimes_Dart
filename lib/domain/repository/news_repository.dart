import 'package:dartz/dartz.dart';
import 'package:ny_news/data/models/article_model.dart';
import 'package:ny_news/data/models/news_search_model/news_search_model.dart';

import '../../core/error/failure.dart';

abstract class NewsRespository {
  Future<Either<Failure, List<ArticleModel>>> getNewsData();
  Future<Either<Failure, List<NewsSearchModel>>> getNewsSearchData(
      String searchNews);
}
