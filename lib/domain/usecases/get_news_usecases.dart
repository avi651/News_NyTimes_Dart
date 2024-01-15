import 'package:dartz/dartz.dart';
import 'package:ny_news/core/error/failure.dart';
import 'package:ny_news/core/usercase/base_use_case.dart';
import 'package:ny_news/data/models/news_model.dart';
import 'package:ny_news/domain/repository/news_repository.dart';

class GetNewsUseCase extends BaseUseCase<List<Result>, NoParameter> {
  final NewsRespository newsRespository;

  GetNewsUseCase(this.newsRespository);

  @override
  Future<Either<Failure, List<Result>>> call(NoParameter p) async {
    return await newsRespository.getNewsData();
  }
}
