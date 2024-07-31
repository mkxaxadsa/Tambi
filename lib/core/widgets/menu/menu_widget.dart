import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
    required this.top,
    required this.title1,
    required this.title2,
    required this.onPressed1,
    required this.onPressed2,
  });

  final double top;
  final String title1;
  final String title2;
  final void Function() onPressed1;
  final void Function() onPressed2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 30,
          top: top,
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              width: 250,
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: AppColors.menu,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  CupertinoButton(
                    onPressed: onPressed1,
                    padding: EdgeInsets.zero,
                    child: SizedBox(
                      height: 44,
                      child: Row(
                        children: [
                          const SizedBox(width: 32),
                          Text(
                            title1,
                            style: const TextStyle(
                              color: AppColors.text,
                              fontSize: 17,
                              fontFamily: 'SF',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 0.5,
                    color: AppColors.border,
                  ),
                  CupertinoButton(
                    onPressed: onPressed2,
                    padding: EdgeInsets.zero,
                    child: SizedBox(
                      height: 44,
                      child: Row(
                        children: [
                          const SizedBox(width: 32),
                          Text(
                            title2,
                            style: const TextStyle(
                              color: AppColors.text,
                              fontSize: 17,
                              fontFamily: 'SF',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
