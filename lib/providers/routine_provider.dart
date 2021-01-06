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

  void toggleRoutineItemAtIndex(String date, int index, bool value) async {
    await Hive.openBox(BoxName);
    Box box = Hive.box(BoxName);
    Routine currenRoutine = box.get(date);
    currenRoutine.routines.elementAt(index).isCompleted = value;
    box.put(date, currenRoutine);
    await box.close();
    notifyListeners();
  }

  Future<int> areRoutinesSet() async {
    await Hive.openBox(BoxName);
    Box box = Hive.box(BoxName);
    return box.length;
  }

  Future<List<RoutineItem>> getRoutineForDate(String date) async {
    await Hive.openBox(BoxName);
    Box box = Hive.box(BoxName);
    Routine currenRoutine = box.get(date);
    return currenRoutine == null ? null : currenRoutine.routines;
  }

  void addRoutineToBox(String date, RoutineItem item) async {
    await Hive.openBox(BoxName);
    Box box = Hive.box(BoxName);
    Routine currenRoutine = box.get(date);
    if (currenRoutine == null) {
      List<RoutineItem> _routineItems = List.empty(growable: true);
      _routineItems.add(item);
      currenRoutine = Routine(routines: _routineItems);
    } else {
      currenRoutine.routines.add(item);
    }
    box.put(date, currenRoutine);
    await box.close();
    notifyListeners();
  }

  void removeItem(String date, int index) async {
    await Hive.openBox(BoxName);
    Box box = Hive.box(BoxName);
    Routine currenRoutine = box.get(date);
    currenRoutine.routines.removeAt(index);
    print(currenRoutine.routines.length);
    box.put(date, currenRoutine);
    await box.close();
    notifyListeners();
  }
}
