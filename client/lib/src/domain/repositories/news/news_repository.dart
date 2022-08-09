import 'package:betify_client/src/core/common/params/empty_params.dart';

import '../../../core/common/data_state.dart';
import '../../models/news/news_article.dart';

abstract class NewsRepository {
  Future<DataState<List<NewsArticle>>> getNews(EmptyParams params);
}
