import 'package:hive/hive.dart';

part 'routine_item.g.dart';

@HiveType(typeId: 3)
class RoutineItem {
  @HiveField(0)
  final String item;

  @HiveField(1)
  final bool isCompleted;

  RoutineItem({this.item, this.isCompleted = false});
}
