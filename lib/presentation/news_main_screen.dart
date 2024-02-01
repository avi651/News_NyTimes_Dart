import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_news/bloc/news_bloc/news_bloc.dart';
import 'package:ny_news/bloc/news_bloc/news_event.dart';
import 'package:ny_news/bloc/news_bloc/news_state.dart';
import 'package:ny_news/bloc/news_search_bloc/news_search_bloc.dart';
import 'package:ny_news/bloc/news_search_bloc/news_search_event.dart';
import 'package:ny_news/bloc/news_search_bloc/news_search_state.dart';
import 'package:ny_news/core/utils/enums.dart';
import 'package:ny_news/domain/usecases/news_search_use_case.dart';
import 'package:ny_news/presentation/components/news_components.dart';
import '../core/components/custom_app_bar.dart';
import '../core/components/error_screen.dart';
import '../core/components/loading_indicator.dart';
import '../core/dependency_injection/dependency_injection.dart';

// class NewsMainScreen extends StatelessWidget {
//   const NewsMainScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => sl<NewsBloc>()..add(GetNewsEvent()),
//       child: Scaffold(
//         appBar: AppBar(),
//         body: BlocBuilder<NewsBloc, NewsState>(
//           builder: (context, state) {
//             switch (state.status) {
//               case RequestStatus.loading:
//                 return const LoadingIndicator();
//               case RequestStatus.loaded:
//                 return NewsComponents(resultModel: state.newsModel);
//               case RequestStatus.error:
//                 return ErrorScreen(
//                   onTryAgainPressed: () {
//                     context.read<NewsBloc>().add(GetNewsEvent());
//                   },
//                 );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

class NewsMainScreen extends StatefulWidget {
  const NewsMainScreen({super.key});

  @override
  State<NewsMainScreen> createState() => _NewsMainScreenState();
}

class _NewsMainScreenState extends State<NewsMainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchBloc>(),
      child: const SearchWidget(),
    );
  }
}

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  void initState() {
    super.initState();
    context.read<SearchBloc>().add(GetNewsSearchResultEvent("Cricket"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            switch (state.status) {
              case SearchRequestStatus.empty:
                return const Center(
                  child: Text("Empty"),
                );
              case SearchRequestStatus.loading:
                return const Expanded(child: LoadingIndicator());
              case SearchRequestStatus.loaded:
                return Center(
                  child: Text(state.searchResults.first.snippet ?? ""),
                );
              case SearchRequestStatus.error:
                return const Center(
                  child: Text("Error"),
                );
              case SearchRequestStatus.noResults:
                return const Center(
                  child: Text("No Results"),
                );
            }
          },
        ),
      ),
    );
  }
}
