import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mood_calendar/models/mood.dart';
import '../../stores/mood_colors.dart';
import '../../extensions/date_extension.dart';

class DayWidget extends StatelessWidget {
  final DateTime date;
  final bool isToday;
  final bool isOutsideDay;

  const DayWidget(this.date, {this.isToday = false, this.isOutsideDay = false});

  int findDifference(DateTime storeDate, DateTime date) {
    final store = DateTime(storeDate.year, storeDate.month, storeDate.day);
    return date.difference(store).inDays;
  }

  MOOD getMoodForDate(DateTime date) {
    Box box = Hive.box('calendar');
    Mood mood = box.get(date.parseDateToString());
    return mood == null ? MOOD.NONE : MOOD.values[mood.mood];
  }

  bool _isMoodColorTransparet(MOOD mood) {
    return MOOD_COLORS[mood] == Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    MOOD mood = getMoodForDate(date);
    return Container(
      margin: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: this.isOutsideDay
            ? _isMoodColorTransparet(mood)
                ? MOOD_COLORS[mood]
                : MOOD_COLORS[mood].withOpacity(0.1)
            : _isMoodColorTransparet(mood)
                ? Colors.transparent
                : MOOD_COLORS[mood].withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
        border: (this.isToday && this.isOutsideDay) || this.isToday
            ? Border.all(
                color: Colors.black,
                width: 2.0,
              )
            : Border.all(
                color: Colors.transparent,
                width: 0.0,
              ),
      ),
      child: Center(
        child: Text(
          '${date.day}',
          style: TextStyle(
            color:
                _isMoodColorTransparet(mood) ? Colors.black : MOOD_COLORS[mood],
            fontSize: 18.0,
            fontWeight: _isMoodColorTransparet(mood)
                ? FontWeight.normal
                : FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
