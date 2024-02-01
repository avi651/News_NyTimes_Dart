import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_news/bloc/news_search_bloc/news_search_event.dart';
import 'package:ny_news/bloc/news_search_bloc/news_search_state.dart';
import 'package:ny_news/domain/usecases/news_search_use_case.dart';
import 'package:stream_transform/stream_transform.dart';

const _duration = Duration(milliseconds: 400);
EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class SearchBloc extends Bloc<NewsSearchEvent, SearchState> {
  SearchBloc(this._searchUseCase) : super(const SearchState()) {
    on<GetNewsSearchResultEvent>(_getSearchResults,
        transformer: debounce(_duration));
  }

  final GetNewsSearchUseCase _searchUseCase;

  Future<void> _getSearchResults(
      GetNewsSearchResultEvent event, Emitter<SearchState> emit) async {
    if (event.title.trim().isEmpty) {
      return emit(
        state.copyWith(
          status: SearchRequestStatus.empty,
        ),
      );
    }

    emit(
      state.copyWith(
        status: SearchRequestStatus.loading,
      ),
    );

    final result = await _searchUseCase(event.title);
    result.fold(
      (l) => emit(
        state.copyWith(
          status: SearchRequestStatus.error,
          message: l.message,
        ),
      ),
      (r) {
        if (r.isEmpty) {
          emit(
            state.copyWith(
              status: SearchRequestStatus.noResults,
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: SearchRequestStatus.loaded,
              searchResults: r,
            ),
          );
        }
      },
    );
  }
}
