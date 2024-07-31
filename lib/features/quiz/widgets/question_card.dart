import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/quiz.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key, required this.quiz});

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CupertinoButton(
        onPressed: () {
          context.push('/comments', extra: quiz);
        },
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage('assets/${quiz.asset}.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'By ${quiz.by}',
                  style: const TextStyle(
                    color: AppColors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SF',
                  ),
                ),
                const Spacer(),
                Text(
                  quiz.date,
                  style: const TextStyle(
                    color: AppColors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SF',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              quiz.question,
              style: const TextStyle(
                color: AppColors.text,
                fontSize: 19,
                fontFamily: 'SF',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      SvgPicture.asset('assets/messages.svg'),
                      const SizedBox(width: 8),
                      Text(
                        quiz.comments.length.toString(),
                        style: const TextStyle(
                          color: AppColors.yellow,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'SFM',
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
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
