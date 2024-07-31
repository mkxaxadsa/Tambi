part of 'operation_bloc.dart';

abstract class OperationState {}

class OperationInitial extends OperationState {}

class OperationsLoadedState extends OperationState {
  final List<Operation> operations;
  OperationsLoadedState({required this.operations});
}
