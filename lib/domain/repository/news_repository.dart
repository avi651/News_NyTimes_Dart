import 'package:dartz/dartz.dart';
import 'package:ny_news/data/models/news_model.dart';

import '../../core/error/failure.dart';

abstract class NewsRespository {
  Future<Either<Failure, List<Result>>> getNewsData();
}
