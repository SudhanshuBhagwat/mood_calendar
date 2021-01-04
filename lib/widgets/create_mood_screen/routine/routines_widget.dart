import 'package:flutter/material.dart';
import 'package:mood_calendar/providers/routine_provider.dart';
import 'package:mood_calendar/widgets/create_mood_screen/routine/add_routine_task.dart';
import 'package:provider/provider.dart';

import '../routine/routine_item_widget.dart';
import '../../../providers/mood_provider.dart';

class RoutinesWidget extends StatelessWidget {
  final items = [
    {'text': 'Hello World', 'isCompleted': false},
    {'text': 'A sample check item', 'isCompleted': true},
  ];

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<RoutineProvider>(context).routineItems;
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Current Routines',
              style: TextStyle(fontSize: 24.0),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.calendar_today),
              iconSize: 34.0,
              onPressed: () {},
            ),
            SizedBox(
              width: 16.0,
            ),
            GestureDetector(
              onTap: () {
                var date = context.read<MoodProvider>().date;
                context.read<RoutineProvider>().addRoutine(date);
                context.read<MoodProvider>().toggleEdit();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.teal.shade400,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10.0),
        Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var item = tasks[index];
              return RoutineItemWidget(
                isChecked: item.isCompleted,
                text: item.item,
                key: UniqueKey(),
                index: index,
              );
            },
          ),
        ),
        AddRoutineTask(),
      ],
    );
  }
}
