import 'package:betify_client/src/core/config/theme/color_constants.dart';
import 'package:betify_client/src/ui/controllers/news_controller.dart';
import 'package:betify_client/src/ui/screens/home/widgets/article_card.dart';
import 'package:betify_client/src/ui/screens/home/widgets/article_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/my_circular_progress_indicator.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.watch(newsProvider.notifier).loadNews();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = ref.watch(newsLoadingProvider);
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
