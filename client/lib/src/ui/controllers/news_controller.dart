import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../register_services.dart';
import '../../core/common/data_state.dart';
import '../../core/common/enums/request_status.dart';
import '../../core/common/params/empty_params.dart';
import '../../domain/models/news/news_article.dart';
import '../../domain/use_cases/news/get_news.dart';

final newsProvider = StateNotifierProvider<NewsController, List<NewsArticle>>(
    (ref) => NewsController(getIt<GetNews>(), ref.read));

final newsLoadingProvider = StateProvider<bool>((ref) => false);

class NewsController extends StateNotifier<List<NewsArticle>> {
  final GetNews getNews;
  final Reader read;

  NewsController(
    this.getNews,
    this.read,
  ) : super([]);

  Future<RequestStatus> loadNews() async {
    if (state.isNotEmpty) {
      return RequestStatus.success;
    }
    return await _sendGetNewsRequest();
  }

  Future<RequestStatus> refreshNews() async {
    return await _sendGetNewsRequest();
  }

  Future<RequestStatus> _sendGetNewsRequest() async {
    read(newsLoadingProvider.notifier).state = true;

    final news = await getNews(params: EmptyParams());

    if (news is DataSuccess) {
      state = news.data!;
      read(newsLoadingProvider.notifier).state = false;
      return RequestStatus.success;
    }
    read(newsLoadingProvider.notifier).state = false;
    return RequestStatus.fail;
  }
}
