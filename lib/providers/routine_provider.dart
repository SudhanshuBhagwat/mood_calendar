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

  Future<int> areRoutinesSet() async {
    await Hive.openBox(BoxName);
    Box box = Hive.box(BoxName);
    return box.length;
  }

  Future<List<RoutineItem>> getRoutineForDate(String date) async {
    if (_routine != null &&
        _routine.date == date &&
        _routine.routines.length > 0) {
      return Future<List<RoutineItem>>.value(_routine.routines);
    }
    await Hive.openBox(BoxName);
    Box box = Hive.box(BoxName);
    Routine currenRoutine = box.get(date);
    if (currenRoutine == null) {
      List<RoutineItem> _routineItems = List.empty(growable: true);
      _routine = Routine(date: date, routines: _routineItems);
      return Future<List<RoutineItem>>.value(_routine.routines);
    } else {
      _routine = currenRoutine;
    }
    // await box.close();
    return _routine.routines;
  }

  void addNewRoutineItem(String date, RoutineItem item) {
    if (_routine != null && _routine.date == date) {
      if (_routine.routines != null) {
        _routine.routines.add(item);
      } else {
        List<RoutineItem> _routineItems = List.empty(growable: true);
        _routineItems.add(item);
        _routine = Routine(date: date, routines: _routineItems);
      }
    } else {
      List<RoutineItem> _routineItems = List.empty(growable: true);
      _routine = Routine(date: date, routines: _routineItems);
    }
    notifyListeners();
  }

  void removeRoutineItem(String date, int index) {
    if (_routine != null && _routine.date == date) {
      if (_routine.routines.length > 0) {
        _routine.routines.removeAt(index);
      }
    }
    notifyListeners();
  }

  void toggleRoutineItem(String date, int index, bool value) {
    if (_routine != null && _routine.date == date) {
      if (_routine.routines.length > 0) {
        _routine.routines[index].isCompleted = value;
      }
    }
    notifyListeners();
  }

  void saveRoutineToBox(String date) async {
    await Hive.openBox(BoxName);
    Box box = Hive.box(BoxName);
    box.put(date, _routine);
    await box.close();
  }

  void resetRoutine(String date) async {
    _routine = null;
    notifyListeners();
  }
}
