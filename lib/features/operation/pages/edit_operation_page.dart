import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/models/operation.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/dialogs/delete_dialog.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../bloc/operation_bloc.dart';
import '../widgets/delete_button.dart';
import '../widgets/icons_list.dart';
import '../widgets/operation_field.dart';
import '../widgets/uppercase_text.dart';

class EditOperationPage extends StatefulWidget {
  const EditOperationPage({super.key, required this.operation});

  final Operation operation;

  @override
  State<EditOperationPage> createState() => _EditOperationPageState();
}

class _EditOperationPageState extends State<EditOperationPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  bool active = true;
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

  void onEdit() {
    context.read<OperationBloc>().add(
          EditOperationEvent(
            operation: Operation(
              id: widget.operation.id,
              name: controller1.text,
              income: income,
              amount: int.parse(controller2.text),
              iconID: iconID,
            ),
          ),
        );
    context.pop();
  }

  void onDelete() {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteDialog(
          title: 'Delete?',
          onYes: () {
            context
                .read<OperationBloc>()
                .add(DeleteOperationEvent(id: widget.operation.id));
            context.pop();
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    controller1.text = widget.operation.name;
    controller2.text = widget.operation.amount.toString();
    income = widget.operation.income;
    iconID = widget.operation.iconID;
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
          const CustomAppbar('Change operation'),
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
                  title: 'Change',
                  active: active,
                  onPressed: onEdit,
                ),
                DeleteButton(onPressed: onDelete),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
