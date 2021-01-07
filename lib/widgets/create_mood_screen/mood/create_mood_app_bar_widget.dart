import 'package:flutter/material.dart';
import 'package:mood_calendar/models/mood.dart';
import 'package:mood_calendar/providers/mood_provider.dart';
import 'package:mood_calendar/providers/routine_provider.dart';
import 'package:provider/provider.dart';

class CreateMoodAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var moodProvider = context.watch<MoodProvider>();
    var routineProvider = context.watch<RoutineProvider>();
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(left: 20.0, right: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              iconSize: 30.0,
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {
                moodProvider.isEdit = false;
                routineProvider.resetRoutine(moodProvider.date);
                Navigator.of(context).pop();
              },
            ),
            Container(),
            IconButton(
              iconSize: 30.0,
              icon: Icon(Icons.check),
              color: Colors.white,
              onPressed: () {
                moodProvider.saveMood();
                routineProvider.saveRoutineToBox(
                  moodProvider.date,
                );
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
