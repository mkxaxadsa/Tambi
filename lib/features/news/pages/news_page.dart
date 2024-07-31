import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/news.dart';
import '../widgets/breaking_news_card.dart';
import '../widgets/news_card.dart';
import '../widgets/news_list_title.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 62 + MediaQuery.of(context).viewPadding.bottom,
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 44),
          const Row(
            children: [
              SizedBox(width: 16),
              Text(
                'News',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SFB',
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const NewsListTitle('Breaking news'),
          const SizedBox(height: 16),
          SizedBox(
            height: 230,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(width: 16),
                BreakingNewsCard(news: breakinhNewsList[0]),
                const SizedBox(width: 8),
                BreakingNewsCard(news: breakinhNewsList[1]),
                const SizedBox(width: 8),
                BreakingNewsCard(news: breakinhNewsList[2]),
                const SizedBox(width: 16),
              ],
            ),
          ),
          const NewsListTitle('Last news'),
          GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 0.83,
            crossAxisSpacing: 8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            children: [
              ...List.generate(
                newsList.length,
                (index) {
                  return NewsCard(
                    news: newsList[index],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
