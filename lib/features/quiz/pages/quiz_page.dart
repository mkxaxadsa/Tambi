import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../widgets/quiz_card.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 44),
          Row(
            children: [
              Text(
                'Quiz',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SFB',
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '1 themes',
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          QuizCard(),
        ],
      ),
    );
  }
}
