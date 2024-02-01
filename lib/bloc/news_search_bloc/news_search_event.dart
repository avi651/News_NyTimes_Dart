import 'package:equatable/equatable.dart';
import 'package:ny_news/data/models/news_search_model/news_search_model.dart';

enum SearchRequestStatus { empty, loading, loaded, error, noResults }

class SearchState extends Equatable {
  const SearchState({
    this.searchResults = const [],
    this.status = SearchRequestStatus.empty,
    this.message = '',
  });

  final List<NewsSearchModel> searchResults;
  final SearchRequestStatus status;
  final String message;

  SearchState copyWith({
    List<NewsSearchModel>? searchResults,
    SearchRequestStatus? status,
    String? message,
  }) {
    return SearchState(
      searchResults: searchResults ?? this.searchResults,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [
        searchResults,
        status,
        message,
      ];
}
