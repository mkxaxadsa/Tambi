import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/menu/menu_widget.dart';
import '../../../core/widgets/textfields/txt_field.dart';

class OperationField extends StatelessWidget {
  const OperationField({
    super.key,
    required this.controller,
    required this.income,
    required this.onSelected,
  });

  final TextEditingController controller;
  final bool income;
  final void Function(bool) onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          TxtField(
            controller: controller,
            hintText: 'Operation name',
            onChanged: () {},
          ),
          Container(
            height: 0.5,
            margin: const EdgeInsets.only(left: 16),
            color: AppColors.border,
          ),
          Container(
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: CupertinoButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return MenuWidget(
                      top: 155,
                      title1: 'Income',
                      title2: 'Expense',
                      onPressed1: () {
                        onSelected(true);
                        context.pop();
                      },
                      onPressed2: () {
                        onSelected(false);
                        context.pop();
                      },
                    );
                  },
                );
              },
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  const Text(
                    'Select operation',
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SF',
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        income ? 'Income' : 'Expense',
                        style: TextStyle(
                          color: AppColors.grey2,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'SF',
                        ),
                      ),
                      const SizedBox(width: 9),
                      SvgPicture.asset('assets/select.svg'),
                      const SizedBox(width: 16),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
