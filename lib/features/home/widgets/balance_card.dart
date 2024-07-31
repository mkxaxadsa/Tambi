import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../operation/bloc/operation_bloc.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Balance',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 15,
                    ),
                  ),
                  BlocBuilder<OperationBloc, OperationState>(
                    builder: (context, state) {
                      return Text(
                        '\$${myIncomes - myExpenses}',
                        style: const TextStyle(
                          color: AppColors.text,
                          fontSize: 31,
                          fontFamily: 'SFB',
                        ),
                      );
                    },
                  ),
                ],
              ),
              const Spacer(),
              CupertinoButton(
                onPressed: () {
                  context.push('/add');
                },
                padding: EdgeInsets.zero,
                minSize: 44,
                child: Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: AppColors.yellow,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          const Row(
            children: [
              _IncomeCard(true),
              SizedBox(width: 16),
              _IncomeCard(false),
            ],
          ),
        ],
      ),
    );
  }
}

class _IncomeCard extends StatelessWidget {
  const _IncomeCard(this.income);

  final bool income;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: AppColors.grey2,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(width: 8),
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: SvgPicture.asset(
                  income
                      ? 'assets/income_arrow1.svg'
                      : 'assets/income_arrow2.svg',
                ),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              height: 42,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    income ? 'Income' : 'Expense',
                    style: const TextStyle(
                      color: AppColors.grey,
                    ),
                  ),
                  BlocBuilder<OperationBloc, OperationState>(
                    builder: (context, state) {
                      return Expanded(
                        child: Text(
                          income ? '\$$myIncomes' : '\$$myExpenses',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            color: AppColors.text,
                            fontSize: 19,
                            fontFamily: 'SFB',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
