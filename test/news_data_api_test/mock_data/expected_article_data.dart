import 'package:ny_news/data/models/article_model.dart';
import 'package:ny_news/data/models/article_response.dart';

ApiResponse<List<ArticleModel>> expectedArticlesEmptyListData = ApiResponse(
  status: "OK",
  copyright:
      "Copyright (c) 2024 The New York Times Company.  All Rights Reserved.",
  numResults: 20,
  results: [],
);

ApiResponse<List<ArticleModel>> expectedArticlesListData = ApiResponse(
  status: "OK",
  copyright:
      "Copyright (c) 2024 The New York Times Company.  All Rights Reserved.",
  numResults: 20,
  results: [
    ArticleModel(
      uri: "nyt://article/4da0900c-c70b-5c07-a2e5-3b9fd2d13a80",
      url:
          "https://www.nytimes.com/2024/01/15/nyregion/e-jean-carroll-trump-defamation-trial.html",
      id: 100000009252470,
    )
  ],
);
