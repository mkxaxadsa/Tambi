import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/news.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(bottom: 25),
      child: CupertinoButton(
        onPressed: () {
          context.push('/news', extra: news);
        },
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: news.image,
                height: 120,
                fit: BoxFit.fitHeight,
                errorWidget: (context, url, error) {
                  return Container();
                },
              ),
            ),
            const SizedBox(height: 8),
            Text(
              news.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.text,
                fontSize: 15,
                fontFamily: 'SF',
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  news.ago,
                  style: const TextStyle(
                    color: AppColors.grey,
                    fontSize: 11,
                    fontFamily: 'SF',
                  ),
                ),
                Container(
                  height: 3,
                  width: 3,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Text(
                  news.readTime,
                  style: const TextStyle(
                    color: AppColors.grey,
                    fontSize: 11,
                    fontFamily: 'SF',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
