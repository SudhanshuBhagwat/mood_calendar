import 'package:hive/hive.dart';

part 'routine_item.g.dart';

@HiveType(typeId: 3)
class RoutineItem {
  @HiveField(0)
  String item;

  @HiveField(1)
  bool isCompleted;

  RoutineItem({this.item, this.isCompleted = false});
}
