import 'package:flutter/cupertino.dart';

import '../../../core/config/app_colors.dart';

class NewsListTitle extends StatelessWidget {
  const NewsListTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.text,
            fontSize: 19,
            fontFamily: 'SFB',
          ),
        ),
        const Spacer(),
        CupertinoButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          minSize: 20,
          child: const Text(
            'See more',
            style: TextStyle(
              color: AppColors.yellow,
              fontSize: 15,
              fontFamily: 'SF',
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
