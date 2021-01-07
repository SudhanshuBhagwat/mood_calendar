import 'package:hive/hive.dart';
import 'package:mood_calendar/models/routine_item.dart';

part 'routine.g.dart';

@HiveType(typeId: 1)
class Routine {
  @HiveField(0)
  List<RoutineItem> routines;

  @HiveField(1)
  String date;

  Routine({this.routines, this.date});
}
