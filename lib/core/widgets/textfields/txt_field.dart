import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/app_colors.dart';

class TxtField extends StatelessWidget {
  const TxtField({
    super.key,
    required this.controller,
    this.hintText = '...',
    this.limit = 30,
    this.borderRadius = 10,
    this.number = false,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final int limit;
  final double borderRadius;
  final bool number;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 2),
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        keyboardType: number ? TextInputType.number : null,
        inputFormatters: [
          if (number) ...[
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(6),
          ] else
            LengthLimitingTextInputFormatter(limit),
        ],
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: AppColors.text,
          fontSize: 17,
          fontWeight: FontWeight.w500,
          fontFamily: 'SF',
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.border,
            fontSize: 17,
            fontWeight: FontWeight.w500,
            fontFamily: 'SF',
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: (value) {
          controller.text = value;
          onChanged();
        },
      ),
    );
  }
}
