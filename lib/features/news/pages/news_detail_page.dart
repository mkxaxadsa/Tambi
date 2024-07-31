import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/news.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar('News'),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                const SizedBox(height: 16),
                Text(
                  news.title,
                  style: const TextStyle(
                    color: AppColors.text,
                    fontSize: 23,
                    fontFamily: 'SFB',
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      news.ago,
                      style: const TextStyle(
                        color: AppColors.grey,
                        fontSize: 13,
                        fontFamily: 'SF',
                      ),
                    ),
                    const Spacer(),
                    Text(
                      news.readTime,
                      style: const TextStyle(
                        color: AppColors.grey,
                        fontSize: 13,
                        fontFamily: 'SF',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: news.image,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  news.desc,
                  style: const TextStyle(
                    color: AppColors.text,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
