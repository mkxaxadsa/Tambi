import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Operation {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  bool income;
  @HiveField(3)
  int amount;
  @HiveField(4)
  int iconID;

  Operation({
    required this.id,
    required this.name,
    required this.income,
    required this.amount,
    required this.iconID,
  });
}

class OperationAdapter extends TypeAdapter<Operation> {
  @override
  final typeId = 0;

  @override
  Operation read(BinaryReader reader) {
    return Operation(
      id: reader.read(),
      name: reader.read(),
      income: reader.read(),
      amount: reader.read(),
      iconID: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Operation obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.income);
    writer.write(obj.amount);
    writer.write(obj.iconID);
  }
}
