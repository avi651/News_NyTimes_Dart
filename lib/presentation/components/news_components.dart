import 'package:flutter/material.dart';
import 'package:ny_news/data/models/article_model.dart';

class NewsComponents extends StatelessWidget {
  final List<ArticleModel> resultModel;
  const NewsComponents({super.key, required this.resultModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(resultModel.first.title ?? ""),
    );
  }
}
