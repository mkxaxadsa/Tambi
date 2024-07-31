import 'dart:io';

import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/quiz.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
    super.key,
    required this.comment,
    required this.onDelete,
  });

  final Comment comment;
  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: 302,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 302,
            child: Row(
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    // image: DecorationImage(
                    // image: comment.current && comment.asset.isNotEmpty
                    //     ? FileImage(File(comment.asset))
                    //     : const AssetImage('assets/user.jpg'),
                    // fit: BoxFit.cover,
                    // ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  comment.by,
                  style: const TextStyle(
                    color: AppColors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SF',
                  ),
                ),
                const Spacer(),
                Text(
                  comment.date,
                  style: const TextStyle(
                    color: AppColors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SF',
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onLongPress: comment.current ? onDelete : null,
            child: Container(
              width: 262,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Text(
                comment.title,
                style: const TextStyle(
                  color: AppColors.text,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SF',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
