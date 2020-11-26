import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/news.dart';
import '../models/source.dart';
import 'api_key.dart';

class Api {
  static const String newsEndpoint = "newsapi.org";

  final client = new http.Client();

  String apiKey = APIKey.newsAPI;

  //Headlines news
  Future<News> getHeadlines() async {
    final queryParameters = {
      // "sources": "bbc-news",
      "country": "us",
    };
    final uri = Uri.https(newsEndpoint, '/v2/top-headlines', queryParameters);
    final response = await client.get(
      uri,
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        'Authorization': 'Bearer $apiKey'
      },
    );
    // print(response.body);
    if (response.statusCode == 200) {
      return News.fromJson(jsonDecode(response.body));
    }
    throw response;
  }

  //Search News
  Future<News> getSearchResult(String keyword) async {
    final queryParameters = {"q": "$keyword", "sortBy": "publishedAt"};
    final uri = Uri.https(newsEndpoint, '/v2/everything', queryParameters);
    final response = await client.get(
      uri,
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        'Authorization': 'Bearer $apiKey'
      },
    );
    // print(response.body);
    return News.fromJson(jsonDecode(response.body));
  }

  //News Source
  Future<NewsSource> getNewsSouces() async {
    final queryParameters = {
      "country": "us",
      "language": "en",
    };
    final uri = Uri.https(newsEndpoint, '/v2/sources', queryParameters);
    final response = await client.get(
      uri,
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        'Authorization': 'Bearer $apiKey'
      },
    );
    // print(response.body);
    return NewsSource.fromJson(jsonDecode(response.body));
  }
}
