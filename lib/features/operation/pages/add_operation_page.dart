import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/models/operation.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../bloc/operation_bloc.dart';
import '../widgets/icons_list.dart';
import '../widgets/operation_field.dart';
import '../widgets/uppercase_text.dart';

class AddOperationPage extends StatefulWidget {
  const AddOperationPage({super.key});

  @override
  State<AddOperationPage> createState() => _AddOperationPageState();
}

class _AddOperationPageState extends State<AddOperationPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  bool active = false;
  bool income = true;
  int iconID = 0;

  void onSelectIncome(bool value) {
    income = value;
    checkActive();
  }

  void onSelectIcon(int value) {
    iconID = value;
    checkActive();
  }

  void checkActive() {
    setState(() {
      if (controller1.text.isEmpty) {
        active = false;
      } else if (controller2.text.isEmpty) {
        active = false;
      } else if (iconID == 0) {
        active = false;
      } else {
        active = true;
      }
    });
  }

  void onAdd() {
    context.read<OperationBloc>().add(
          AddOperationEvent(
            operation: Operation(
              id: getCurrentTimestamp(),
              name: controller1.text,
              income: income,
              amount: int.parse(controller2.text),
              iconID: iconID,
            ),
          ),
        );
    context.pop();
  }

  @override
  void dispose() {
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar('Add operation'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 24),
                OperationField(
                  controller: controller1,
                  income: income,
                  onSelected: onSelectIncome,
                ),
                const SizedBox(height: 24),
                const UppercaseText('AMOUNT MONEY'),
                const SizedBox(height: 7),
                TxtField(
                  controller: controller2,
                  hintText: '\$0',
                  number: true,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 24),
                const UppercaseText('ICON'),
                const SizedBox(height: 7),
                IconsList(
                  index: iconID,
                  onTap: onSelectIcon,
                ),
                const SizedBox(height: 24),
                PrimaryButton(
                  title: 'Add',
                  active: active,
                  onPressed: onAdd,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
