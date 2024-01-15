import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_news/bloc/news_bloc/news_event.dart';
import 'package:ny_news/bloc/news_bloc/news_state.dart';
import 'package:ny_news/core/usercase/base_use_case.dart';
import '../../core/utils/enums.dart';
import '../../domain/usecases/get_news_usecases.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsUseCase _getNewsUseCase;

  NewsBloc(
    this._getNewsUseCase,
  ) : super(const NewsState()) {
    on<GetNewsEvent>(_getNews);
  }

  Future<void> _getNews(GetNewsEvent event, Emitter<NewsState> emit) async {
    emit(
      state.copyWith(
        status: RequestStatus.loading,
      ),
    );
    final result = await _getNewsUseCase(const NoParameter());
    result.fold(
      (l) => emit(
        state.copyWith(
          status: RequestStatus.error,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: RequestStatus.loaded,
          newsModel: r,
        ),
      ),
    );
  }
}
