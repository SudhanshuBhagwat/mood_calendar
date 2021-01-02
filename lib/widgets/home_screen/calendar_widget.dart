import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../providers/mood_provider.dart';
import '../../screens/create_mood_screen.dart';
import '../../widgets/home_screen/day_widget.dart';
import '../../extensions/date_extension.dart';

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  bool _isExtraDay(DateTime day, DateTime currentDay) {
    return _isExtraDayBefore(day, currentDay) ||
        _isExtraDayAfter(day, currentDay);
  }

  bool _isExtraDayBefore(DateTime day, DateTime currentDay) {
    return day.month < currentDay.month;
  }

  bool _isExtraDayAfter(DateTime day, DateTime currentDay) {
    return day.month > currentDay.month;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MoodProvider>(context);
    return ValueListenableBuilder(
        valueListenable: Hive.box('calendar').listenable(),
        builder: (context, box, widget) {
          return RepaintBoundary(
            child: TableCalendar(
              calendarController: _calendarController,
              headerStyle: HeaderStyle(
                leftChevronVisible: false,
                rightChevronVisible: false,
                formatButtonVisible: false,
                headerMargin: const EdgeInsets.only(bottom: 30.0, left: 30.0),
                titleTextStyle:
                    TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              availableGestures: AvailableGestures.horizontalSwipe,
              onDayLongPressed: (day, events, holidays) {
                provider.date = day.parseDateToString();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CreateMoodScreen(),
                  ),
                );
              },
              builders: CalendarBuilders(
                dowWeekdayBuilder: (context, weekday) => Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: Center(
                    child: Text(
                      weekday.substring(0, 1),
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                todayDayBuilder: (context, date, events) {
                  bool isExtra =
                      _isExtraDay(date, _calendarController.focusedDay);
                  return DayWidget(date, isToday: true, isOutsideDay: isExtra);
                },
                outsideDayBuilder: (context, date, events) =>
                    DayWidget(date, isOutsideDay: true),
                outsideWeekendDayBuilder: (context, date, events) =>
                    DayWidget(date, isOutsideDay: true),
                dayBuilder: (context, date, events) => DayWidget(date),
              ),
            ),
          );
        });
  }
}
