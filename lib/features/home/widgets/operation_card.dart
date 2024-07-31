import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/operation.dart';
import '../../../core/widgets/dialogs/delete_dialog.dart';
import '../../operation/bloc/operation_bloc.dart';

class OperationCard extends StatelessWidget {
  const OperationCard({super.key, required this.operation});

  final Operation operation;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const ScrollMotion(),
        children: [
          Container(
            height: 60,
            width: 74,
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: const Color(0xffFF3B30),
              borderRadius: BorderRadius.circular(10),
            ),
            child: CupertinoButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DeleteDialog(
                      title: 'Delete?',
                      onYes: () {
                        context
                            .read<OperationBloc>()
                            .add(DeleteOperationEvent(id: operation.id));
                      },
                    );
                  },
                );
              },
              padding: EdgeInsets.zero,
              child: Center(
                child: SvgPicture.asset('assets/delete.svg'),
              ),
            ),
          ),
        ],
      ),
      child: Container(
        height: 60,
        margin: const EdgeInsets.only(bottom: 8),
        decoration: const BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: CupertinoButton(
          onPressed: () {
            context.push('/edit', extra: operation);
          },
          padding: EdgeInsets.zero,
          child: Row(
            children: [
              const SizedBox(width: 8),
              Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  color: AppColors.yellow14,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: SvgPicture.asset('assets/icon${operation.iconID}.svg'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        operation.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.text,
                          fontSize: 17,
                          fontFamily: 'SF',
                        ),
                      ),
                      Text(
                        operation.income ? 'Income' : 'Expense',
                        style: const TextStyle(
                          color: AppColors.grey,
                          fontSize: 15,
                          fontFamily: 'SF',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                operation.income
                    ? '+${operation.amount}'
                    : '-\$${operation.amount}',
                style: TextStyle(
                  color: operation.income
                      ? const Color(0xff34C759)
                      : const Color(0xffFF3B30),
                  fontSize: 15,
                  fontFamily: 'SF',
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}
