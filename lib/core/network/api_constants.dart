class ApiConstants {
  static const String apiKey = 'R2VHrCd97aefx3LKGH18LXGQPsknaKJ9';
  static const String baseUrl =
      'https://api.nytimes.com/svc/mostpopular/v2/viewed/';
  static const String secondBaseUrl = 'https://api.nytimes.com/svc/search/v2';

  static const String mostPopularData = '$baseUrl/1.json?api-key=$apiKey';

  static String getAllSearchNews(String searchNews) {
    return '$secondBaseUrl/articlesearch.json?q=$searchNews&api-key=$apiKey';
  }
}
