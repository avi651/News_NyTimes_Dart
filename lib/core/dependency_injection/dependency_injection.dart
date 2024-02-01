import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ny_news/bloc/news_search_bloc/news_search_bloc.dart';
import 'package:ny_news/domain/repository/news_repository.dart';
import 'package:ny_news/domain/usecases/news_search_use_case.dart';
import '../../bloc/news_bloc/news_bloc.dart';
import '../../data/datasource/news_remote_data_source.dart';
import '../../data/repository/news_repository_impl.dart';
import '../../domain/usecases/get_news_usecases.dart';

final sl = GetIt.instance;

class DependencyInjection {
  static void init() {
    // Data source
    sl.registerLazySingleton<NewsRemoteDataSource>(
        () => NewsRemoteDataSourceImpl());
    // Repository
    sl.registerLazySingleton<NewsRespository>(() => NewsRepositoryImpl(sl()));
    // Use Cases
    sl.registerLazySingleton(() => GetNewsUseCase(sl()));
    sl.registerSingleton<GetNewsSearchUseCase>(GetNewsSearchUseCase(sl()));
    // Bloc
    sl.registerFactory(() => NewsBloc(sl()));
     sl.registerFactory(() => SearchBloc(sl()));
    // Dio
    sl.registerLazySingleton(() => Dio());
  }
}
