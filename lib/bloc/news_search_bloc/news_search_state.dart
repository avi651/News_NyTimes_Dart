import 'package:equatable/equatable.dart';

abstract class NewsSearchEvent extends Equatable {
  const NewsSearchEvent();
}

class GetNewsSearchResultEvent extends NewsSearchEvent {
  final String title;

  const GetNewsSearchResultEvent(this.title);

  @override
  List<Object?> get props => [title];
}
