import 'package:flutter/material.dart';

import '../../../../core/common/mixins/format_date_mixin.dart';
import '../../../../core/config/theme/color_constants.dart';
import '../../../../core/config/theme/my_theme.dart';
import '../../../../domain/models/news/news_article.dart';

class ArticleCard extends StatelessWidget with FormatDateMixin {
  final NewsArticle article;

  const ArticleCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          color: ColorConstants.appBar,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: NetworkImage(article.urlToImage),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  article.title,
                  style: MyTheme.headerMediumTextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                child: Text(
                  formatDate(article.publishedAt),
                  style: MyTheme.primaryTextStyleWithColor(
                      ColorConstants.secondaryText),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
