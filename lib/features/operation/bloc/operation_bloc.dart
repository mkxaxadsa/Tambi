import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/operation.dart';
import '../../../core/utils.dart';

part 'operation_event.dart';
part 'operation_state.dart';

class OperationBloc extends Bloc<OperationEvent, OperationState> {
  List<Operation> _operations = [];

  OperationBloc() : super(OperationInitial()) {
    on<GetOperationsEvent>((event, emit) async {
      if (operationsList.isEmpty) {
        _operations = await getModels();
        emit(OperationsLoadedState(operations: _operations));
      } else {
        emit(OperationsLoadedState(operations: _operations));
      }
    });

    on<AddOperationEvent>((event, emit) async {
      operationsList.add(event.operation);
      _operations = await updateModels();
      emit(OperationsLoadedState(operations: _operations));
    });

    on<EditOperationEvent>((event, emit) async {
      for (Operation operation in operationsList) {
        if (operation.id == event.operation.id) {
          operation.name = event.operation.name;
          operation.income = event.operation.income;
          operation.amount = event.operation.amount;
          operation.iconID = event.operation.iconID;
        }
      }

      _operations = await updateModels();

      emit(OperationsLoadedState(operations: _operations));
    });

    on<DeleteOperationEvent>((event, emit) async {
      operationsList.removeWhere((element) => element.id == event.id);
      _operations = await updateModels();
      emit(OperationsLoadedState(operations: _operations));
    });
  }
}
