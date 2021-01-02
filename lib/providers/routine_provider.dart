import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mood_calendar/models/routine.dart';
import 'package:mood_calendar/models/routine_item.dart';

class RoutineProvider extends ChangeNotifier {
  static const BoxName = 'routines';
  Routine _routine;
  List<RoutineItem> _routineItems = List.empty(growable: true);

  Routine get routine => _routine;
  List<RoutineItem> get routineItems => _routineItems;

  set routine(Routine currentRoutine) {
    this._routine = currentRoutine;
  }

  void addRoutineItems(RoutineItem item) {
    _routineItems.add(item);
  }

  Future<int> areRoutinesSet() async {
    await Hive.openBox(BoxName);
    Box box = Hive.box(BoxName);
    return box.length;
  }

  Future<Routine> getRoutineForDate(String date) async {
    await Hive.openBox(BoxName);
    Box box = Hive.box(BoxName);
    Routine currenRoutine = box.get(date);
    _routine = currenRoutine;
    await box.close();
    return currenRoutine;
  }

  void addRoutine(String date) async {
    await Hive.openBox(BoxName);
    Box box = Hive.box(BoxName);
    box.put(date, _routine);
    await box.close();
  }

  void updateRoutine(String date) async {
    await Hive.openBox(BoxName);
    Box box = Hive.box(BoxName);
    box.put(date, _routine);
    await box.close();
  }

  void addItemToRoutine(String date, RoutineItem routineItem) async {
    _routine.routines.add(routineItem);
    await Hive.openBox(BoxName);
    Box box = Hive.box(BoxName);
    box.put(date, _routine);
    await box.close();
  }

  void updateRoutineItem(
      String oldRoutineItemText, String newRoutineText) async {
    _routine.routines.forEach((routineItem) {
      if (routineItem.item == oldRoutineItemText) {
        routineItem.item = newRoutineText;
      }
    });
  }

  void toggleRoutineItem(String routineText) async {
    _routine.routines.forEach((routineItem) {
      if (routineItem.item == routineText) {
        routineItem.isCompleted = !routineItem.isCompleted;
      }
    });
  }
}
