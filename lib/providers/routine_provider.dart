import 'package:flutter/material.dart';

class RoutineProvider extends ChangeNotifier {
  String _date;

  String get date => _date;

  set date(String dateTime) {
    this._date = dateTime;
  }
}
