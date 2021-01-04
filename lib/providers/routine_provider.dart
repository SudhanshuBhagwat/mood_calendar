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

  void toggleRoutineItemAtIndex(int index, bool value) {
    _routineItems.elementAt(index).isCompleted = value;
    notifyListeners();
  }

  void addRoutineItems(RoutineItem item) {
    _routineItems.add(item);
    print(_routineItems.length);
    notifyListeners();
  }

  Future<int> areRoutinesSet() async {
    await Hive.openBox(BoxName);
    Box box = Hive.box(BoxName);
    return box.length;
  }

  void getRoutineForDate(String date) async {
    print('He');
    await Hive.openBox(BoxName);
    Box box = Hive.box(BoxName);
    Routine currenRoutine = box.get(date);
    if (currenRoutine == null) {
      _routine = Routine();
      _routineItems.clear();
    } else {
      _routine = currenRoutine;
      _routineItems = currenRoutine.routines;
    }
    await box.close();
  }

  void addRoutine(String date) async {
    await Hive.openBox(BoxName);
    Box box = Hive.box(BoxName);
    _routine = Routine(routines: _routineItems);
    box.put(date, _routine);
    await box.close();
  }

  void removeItem(int index) {
    _routineItems.removeAt(index);
    notifyListeners();
  }
}
