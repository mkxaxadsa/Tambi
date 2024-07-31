import 'package:flutter/cupertino.dart';

import '../../../core/config/app_colors.dart';

class TransactionTabs extends StatelessWidget {
  const TransactionTabs({
    super.key,
    required this.tabIndex,
    required this.onTap,
  });

  final int tabIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Button(
          title: 'All',
          active: tabIndex == 0,
          index: 0,
          onTap: onTap,
        ),
        const SizedBox(width: 8),
        _Button(
          title: 'Income',
          active: tabIndex == 1,
          index: 1,
          onTap: onTap,
        ),
        const SizedBox(width: 8),
        _Button(
          title: 'Expense',
          active: tabIndex == 2,
          index: 2,
          onTap: onTap,
        ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.title,
    required this.active,
    required this.index,
    required this.onTap,
  });

  final String title;
  final bool active;
  final int index;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        color: active ? AppColors.yellow : AppColors.card,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CupertinoButton(
        onPressed: () {
          onTap(index);
        },
        padding: EdgeInsets.zero,
        minSize: 32,
        child: Row(
          children: [
            const SizedBox(width: 24),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.text,
                fontSize: 15,
              ),
            ),
            const SizedBox(width: 24),
          ],
        ),
      ),
    );
  }
}
