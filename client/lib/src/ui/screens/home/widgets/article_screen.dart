import 'package:flutter/material.dart';

import '../../../../core/common/mixins/format_date_mixin.dart';
import '../../../../core/config/theme/color_constants.dart';
import '../../../../core/config/theme/my_theme.dart';
import '../../../../domain/models/news/news_article.dart';

class ArticleScreen extends StatelessWidget with FormatDateMixin {
  final NewsArticle article;

  const ArticleScreen({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(article.urlToImage),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              article.title,
              style: MyTheme.headerMediumTextStyle(),
            ),
            Text(
              formatDate(article.publishedAt),
              style: MyTheme.primaryTextStyleWithColor(
                  ColorConstants.secondaryText),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              article.content,
              style: MyTheme.primaryTextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
