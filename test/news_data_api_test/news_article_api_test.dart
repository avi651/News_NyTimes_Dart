import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_news/core/error/exceptions.dart';
import 'package:ny_news/core/network/api_constants.dart';
import 'package:ny_news/data/datasource/news_remote_data_source.dart';

import 'mock_data/actual_article_json.dart';
import 'mock_data/expected_article_data.dart';
import 'news_article_api_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  // Api Params

  // Mocked Dio class
  late MockDio mockDio;
  RequestOptions requestOptions = RequestOptions();
  // Our Api class that we need to test it.
  // The dependency for this class will be from the mocked Dio class not from
  // real Dio class
  late NewsRemoteDataSource articlesApi;
  setUp(() {
    mockDio = MockDio();
    articlesApi = NewsRemoteDataSourceImpl(dio: mockDio);
  });

  group("Test articles_impl_api", () {
    test("Get All Articles - Failed Case", () async {
      // Mockito will store the fake call to `fakeCall`, and pair the exact
      // arguments given with the response. When `fakeCall` is called outside a
      // `when` or `verify` context (a call "for real"), Mockito will respond with
      // the stored canned response, if it can match the mock method parameters.
      when(mockDio.get(ApiConstants.mostPopularData))
          .thenAnswer((realInvocation) async {
        // Actual result
        return Response(requestOptions: requestOptions, statusCode: 400);
      });
      var result;
      try {
        result = await articlesApi.getNewsDataArticle();
      } catch (e) {
        result = e;
      }
      // Compare actual result with expected result
      expect(result, ApiTestException("Unknown Error", 400));
    });
    test("Get All Articles - Empty Case", () async {
      when(mockDio.get(ApiConstants.mostPopularData))
          .thenAnswer((realInvocation) async {
        // Actual result
        return Response(
          requestOptions: requestOptions,
          statusCode: 200,
          data: actualArticlesListJson,
        );
      });

      print("The actual data is ->$actualArticlesListJson");
      var result;
      try {
        // Compare actual result with expected result
        result = await articlesApi.getNewsDataArticle();
        print("The result is ->$result");
      } catch (e) {
        result = e;
      }
      print("The Expected data is ->$expectedArticlesListData");
      expect(result, expectedArticlesListData);
    });
  });
}
