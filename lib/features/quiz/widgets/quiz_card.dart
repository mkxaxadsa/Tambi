import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/quiz.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 172,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CupertinoButton(
        onPressed: () {
          context.push('/question');
        },
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            const Text(
              'Possible improvements or modifications',
              style: TextStyle(
                color: AppColors.text,
                fontSize: 21,
                fontFamily: 'SF',
              ),
            ),
            const SizedBox(height: 4),
            const Row(
              children: [
                Text(
                  'April 1, 2024',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 15,
                    fontFamily: 'SF',
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                SizedBox(
                  height: 44,
                  width: 200,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 48,
                        child: Container(
                          height: 34,
                          width: 34,
                          decoration: BoxDecoration(
                            color: AppColors.card,
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                              width: 2,
                              color: AppColors.card,
                            ),
                            image: const DecorationImage(
                              image: AssetImage('assets/user3.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 24,
                        child: Container(
                          height: 34,
                          width: 34,
                          decoration: BoxDecoration(
                            color: AppColors.card,
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                              width: 2,
                              color: AppColors.card,
                            ),
                            image: const DecorationImage(
                              image: AssetImage('assets/user2.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: Container(
                          height: 34,
                          width: 34,
                          decoration: BoxDecoration(
                            color: AppColors.card,
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                              width: 2,
                              color: AppColors.card,
                            ),
                            image: const DecorationImage(
                              image: AssetImage('assets/user1.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 88,
                        top: 5,
                        child: Text(
                          '${quizesListModel.length} questions',
                          style: const TextStyle(
                            color: AppColors.yellow,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.yellow,
                    ),
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
