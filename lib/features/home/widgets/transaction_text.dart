import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class TransactionText extends StatelessWidget {
  const TransactionText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Transactions',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 19,
            fontFamily: 'SFB',
          ),
        ),
      ],
    );
  }
}
