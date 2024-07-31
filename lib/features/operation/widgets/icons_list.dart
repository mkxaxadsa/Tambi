import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/config/app_colors.dart';

class IconsList extends StatelessWidget {
  const IconsList({
    super.key,
    required this.index,
    required this.onTap,
  });

  final int index;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 132,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Button(
                index: 1,
                selected: index == 1,
                onTap: onTap,
              ),
              _Button(
                index: 2,
                selected: index == 2,
                onTap: onTap,
              ),
              _Button(
                index: 3,
                selected: index == 3,
                onTap: onTap,
              ),
              _Button(
                index: 4,
                selected: index == 4,
                onTap: onTap,
              ),
              _Button(
                index: 5,
                selected: index == 5,
                onTap: onTap,
              ),
              _Button(
                index: 6,
                selected: index == 6,
                onTap: onTap,
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Button(
                index: 7,
                selected: index == 7,
                onTap: onTap,
              ),
              _Button(
                index: 8,
                selected: index == 8,
                onTap: onTap,
              ),
              _Button(
                index: 9,
                selected: index == 9,
                onTap: onTap,
              ),
              _Button(
                index: 10,
                selected: index == 10,
                onTap: onTap,
              ),
              _Button(
                index: 11,
                selected: index == 11,
                onTap: onTap,
              ),
              _Button(
                index: 12,
                selected: index == 12,
                onTap: onTap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.index,
    required this.selected,
    required this.onTap,
  });

  final int index;
  final bool selected;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        onTap(index);
      },
      padding: EdgeInsets.zero,
      minSize: 42,
      child: Container(
        height: 42,
        width: 42,
        decoration: BoxDecoration(
          color: AppColors.yellow14,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected ? AppColors.yellow : Colors.transparent,
          ),
        ),
        child: Center(
          child: SvgPicture.asset('assets/icon$index.svg'),
        ),
      ),
    );
  }
}
