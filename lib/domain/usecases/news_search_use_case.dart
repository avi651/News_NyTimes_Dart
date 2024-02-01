import 'package:dartz/dartz.dart';
import 'package:ny_news/core/error/failure.dart';
import 'package:ny_news/core/usercase/base_use_case.dart';
import 'package:ny_news/data/models/news_search_model/news_search_model.dart';
import 'package:ny_news/domain/repository/news_repository.dart';

class GetNewsSearchUseCase extends BaseUseCase<List<NewsSearchModel>, String> {
  final NewsRespository newsRespository;
  GetNewsSearchUseCase(this.newsRespository);

  @override
  Future<Either<Failure, List<NewsSearchModel>>> call(String p) async {
    return await newsRespository.getNewsSearchData(p);
  }
}
