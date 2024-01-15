import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_news/bloc/news_bloc/news_bloc.dart';
import 'package:ny_news/bloc/news_bloc/news_event.dart';
import 'package:ny_news/bloc/news_bloc/news_state.dart';
import 'package:ny_news/core/utils/enums.dart';
import 'package:ny_news/presentation/components/news_components.dart';
import '../core/components/error_screen.dart';
import '../core/components/loading_indicator.dart';
import '../core/dependency_injection/dependency_injection.dart';

class NewsMainScreen extends StatelessWidget {
  const NewsMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NewsBloc>()..add(GetNewsEvent()),
      child: Scaffold(
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return const LoadingIndicator();
              case RequestStatus.loaded:
                return NewsComponents(resultModel: state.newsModel);
              case RequestStatus.error:
                return ErrorScreen(
                  onTryAgainPressed: () {
                    context.read<NewsBloc>().add(GetNewsEvent());
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
