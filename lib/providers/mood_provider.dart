import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mood_calendar/stores/mood_colors.dart';
import '../models/mood.dart';

class MoodProvider with ChangeNotifier {
  static const BoxName = 'calendar';
  String _date;
  String _title;
  int _moodEnum;
  Mood _mood;
  bool _isEdit = false;

  bool get isEdit => _isEdit;
  String get date => _date;
  String get title => _title;
  Mood get mood => _mood;
  int get moodEnum => _moodEnum;

  set isEdit(bool edit) {
    this._isEdit = edit;
  }

  set mood(Mood mood) {
    this._mood = mood;
  }

  set moodEnum(int mood) {
    this._moodEnum = mood;
  }

  set date(String dateTime) {
    this._date = dateTime;
  }

  set title(String title) {
    this._title = title;
  }

  void toggleEdit() {
    this._isEdit = !this._isEdit;
    notifyListeners();
  }

  void saveMood() {
    Box box = Hive.box(BoxName);
    _mood = new Mood(mood: _moodEnum, title: _title);
    box.put(date, _mood);
    notifyListeners();
  }

  bool isAlreadyPresent(String dateTime) {
    Box box = Hive.box(BoxName);
    return box.containsKey(dateTime);
  }

  MOOD getMoodForDate(String dateTime) {
    Box box = Hive.box(BoxName);
    Mood boxMood = box.get(dateTime);
    return boxMood == null ? MOOD.NONE : MOOD.values[boxMood.mood];
  }

  Mood getMood(String dateTime) {
    Box box = Hive.box(BoxName);
    return box.get(dateTime);
  }
}
