import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/quiz.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/dialogs/delete_dialog.dart';
import '../bloc/quiz_bloc.dart';
import '../widgets/comment_card.dart';

class QuizCommentsPage extends StatefulWidget {
  const QuizCommentsPage({super.key, required this.quiz});

  final Quiz quiz;

  @override
  State<QuizCommentsPage> createState() => _QuizCommentsPageState();
}

class _QuizCommentsPageState extends State<QuizCommentsPage> {
  final controller = TextEditingController();
  final scrollController = ScrollController();

  void addComment() async {
    if (controller.text.isNotEmpty) {
      commentsList.add(Comment(
        quizID: widget.quiz.id,
        by: '$firstName $lastName',
        asset: imagePath,
        date: formatDate(),
        title: controller.text,
        current: true,
      ));
      await updateComments().then((value) {
        context.read<QuizBloc>().add(GetQuizsEvent());
      });
      setState(() {});
      Future.delayed(const Duration(milliseconds: 100), () {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
        setState(() {});
      });
      controller.clear();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      resize: true,
      body: Column(
        children: [
          CustomAppbar('${widget.quiz.comments.length} Comments'),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              controller: scrollController,
              children: [
                const SizedBox(height: 16),
                _QuestionCard(quiz: widget.quiz),
                const SizedBox(height: 16),
                ...List.generate(
                  widget.quiz.comments.length,
                  (index) {
                    return CommentCard(
                      comment: widget.quiz.comments[index],
                      onDelete: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return DeleteDialog(
                              title: 'Delete this message?',
                              onYes: () async {
                                commentsList
                                    .remove(widget.quiz.comments[index]);
                                await updateComments().then((value) {
                                  context.read<QuizBloc>().add(GetQuizsEvent());
                                });
                                FocusManager.instance.primaryFocus?.unfocus();
                                setState(() {});
                              },
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          _MessageField(
            controller: controller,
            onSend: addComment,
            onTap: () {
              Future.delayed(const Duration(milliseconds: 400), () {
                scrollController
                    .jumpTo(scrollController.position.maxScrollExtent);
                setState(() {});
              });
            },
          ),
        ],
      ),
    );
  }
}

class _QuestionCard extends StatelessWidget {
  const _QuestionCard({required this.quiz});

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(10),
      ),
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
        ],
      ),
    );
  }
}

class _MessageField extends StatelessWidget {
  const _MessageField({
    required this.controller,
    required this.onSend,
    required this.onTap,
  });

  final TextEditingController controller;
  final void Function() onSend;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewPadding.bottom,
      ),
      height: 87,
      child: Row(
        children: [
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              height: 54,
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: controller,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(50),
                ],
                textCapitalization: TextCapitalization.sentences,
                style: const TextStyle(
                  color: AppColors.text,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SF',
                ),
                decoration: const InputDecoration(
                  hintText: 'Message',
                  hintStyle: TextStyle(
                    color: AppColors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SF',
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
                onTap: onTap,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(27),
            ),
            child: CupertinoButton(
              onPressed: onSend,
              padding: EdgeInsets.zero,
              minSize: 54,
              child: Center(
                child: SvgPicture.asset('assets/send.svg'),
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
