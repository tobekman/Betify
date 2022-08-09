import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../core/common/data_state.dart';
import '../../../core/common/params/empty_params.dart';
import '../../../domain/models/news/news_article.dart';
import '../../../domain/repositories/news/news_repository.dart';

class NewsService implements NewsRepository {
  @override
  Future<DataState<List<NewsArticle>>> getNews(EmptyParams params) async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?category=sports&apiKey=0967b937d56c42cc8edc57f3a66f995b&country=gb&pageSize=5');

    try {
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      final body = jsonDecode(response.body)['articles'];
    
      List<NewsArticle> news = [];
      for (dynamic article in body) {
        news.add(NewsArticle.fromMap(article));
      }

      return DataSuccess(news);
    } on Exception catch (e) {
      return DataFailed(e);
    }
  }
}
