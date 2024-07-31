import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import 'buttons/arrow_back_button.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Row(
        children: [
          const ArrowBackButton(),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.text,
              fontSize: 19,
              fontFamily: 'SFB',
            ),
          ),
          const Spacer(),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}
