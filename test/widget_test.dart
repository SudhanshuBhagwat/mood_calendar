import 'dart:io';

import 'package:hive/hive.dart';
import 'package:mood_calendar/models/mood.dart';
import 'package:mood_calendar/models/routine.dart';
import 'package:mood_calendar/models/routine_item.dart';

void main() async {
  final appDocumentDir = Directory('C:/Users/sbhagwa/Documents/Projects');
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(MoodAdapter());
  Hive.registerAdapter(RoutineAdapter());
  Hive.registerAdapter(RoutineItemAdapter());
  Box box = await Hive.openBox('routine');

  Mood mood = new Mood(mood: 7, title: 'A sample title');
  RoutineItem item = RoutineItem(item: 'Something');
  RoutineItem item1 = RoutineItem(item: 'Something1');
  RoutineItem item2 = RoutineItem(item: 'Something2');
  RoutineItem item3 = RoutineItem(item: 'Something3');

  String date = '2020-12-31';

  // box.put(date, mood);
  // Mood _mood = box.get(date);
  // print(_mood.title);
  List<RoutineItem> list = List<RoutineItem>.empty(growable: true);

  list.add(item);
  list.add(item1);
  list.add(item2);
  list.add(item3);

  Routine routine = Routine(routines: list);
  // print(routine.routines);
  // box.put(date, routine);
  print(box.length);
  // Routine r = box.get(date);
  // List<RoutineItem> routineList = r.routines;
  // routineList.forEach((e) {
  //   print(e.item);
  // });
}
