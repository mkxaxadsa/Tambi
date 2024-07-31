import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class UppercaseText extends StatelessWidget {
  const UppercaseText(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
