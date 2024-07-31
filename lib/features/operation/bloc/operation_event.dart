part of 'operation_bloc.dart';

abstract class OperationEvent {}

class GetOperationsEvent extends OperationEvent {}

class AddOperationEvent extends OperationEvent {
  final Operation operation;
  AddOperationEvent({required this.operation});
}

class EditOperationEvent extends OperationEvent {
  final Operation operation;
  EditOperationEvent({required this.operation});
}

class DeleteOperationEvent extends OperationEvent {
  final int id;
  DeleteOperationEvent({required this.id});
}
