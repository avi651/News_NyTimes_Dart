import 'package:flutter/material.dart';
import 'package:ny_news/core/components/vertical_list_view.dart';
import 'package:ny_news/core/components/vertical_list_view_card.dart';
import 'package:ny_news/data/models/article_model.dart';

import '../../core/components/loading_indicator.dart';

class NewsComponents extends StatelessWidget {
  final List<ArticleModel> resultModel;
  const NewsComponents({super.key, required this.resultModel});

  @override
  Widget build(BuildContext context) {
    return VerticalListView(
      itemCount: resultModel.length,
      itemBuilder: (context, index) {
        return VerticalListViewCard(articleModel: resultModel[index]);
      },
      addEvent: () {
        print("Fetch More");
      },
    );
  }
}
