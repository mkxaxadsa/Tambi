import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/quiz.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../bloc/quiz_bloc.dart';
import '../widgets/question_card.dart';

class QuizQuestionsPage extends StatelessWidget {
  const QuizQuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar('Quiz'),
          BlocBuilder<QuizBloc, QuizState>(
            builder: (context, state) {
              return Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    const SizedBox(height: 8),
                    const Text(
                      'Possible improvements or modifications',
                      style: TextStyle(
                        color: AppColors.text,
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'SFB',
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Row(
                      children: [
                        Text(
                          '10 Questions',
                          style: TextStyle(
                            color: AppColors.text,
                            fontSize: 15,
                            fontFamily: 'SFM',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ...List.generate(
                      quizesListModel.length,
                      (index) {
                        return QuestionCard(quiz: quizesListModel[index]);
                      },
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
