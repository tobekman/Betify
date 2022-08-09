import 'package:betify_client/src/domain/repositories/news/news_repository.dart';

import '../../../core/common/data_state.dart';
import '../../../core/common/params/empty_params.dart';
import '../../../core/common/use_case.dart';
import '../../models/news/news_article.dart';

class GetNews implements UseCase<DataState<List<NewsArticle>>, EmptyParams> {
  final NewsRepository service;

  GetNews(this.service);

  @override
  Future<DataState<List<NewsArticle>>> call({required EmptyParams params}) {
    return service.getNews(params);
  }
}
