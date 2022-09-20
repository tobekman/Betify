import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/news_controller.dart';
import 'widgets/article_card.dart';
import 'widgets/article_screen.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.watch(newsProvider.notifier).loadNews();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final news = ref.watch(newsProvider);

    return NotificationListener(
      onNotification: ((ScrollNotification notification) {
        if (notification.metrics.pixels < -150) {
          ref.watch(newsProvider.notifier).refreshNews();
        }
        return true;
      }),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: news.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ArticleScreen(article: news[index]),
                ),
              );
            },
            child: ArticleCard(
              article: news[index],
            ),
          );
        },
      ),
    );
  }
}
