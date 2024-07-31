import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: 48,
      child: CupertinoButton(
        onPressed: () {
          Navigator.pop(context);
        },
        padding: EdgeInsets.zero,
        child: const Center(
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.text,
          ),
        ),
      ),
    );
  }
}
