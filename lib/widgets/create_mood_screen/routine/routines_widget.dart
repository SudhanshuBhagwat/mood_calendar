import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/routine_provider.dart';
import '../../../widgets/create_mood_screen/routine/add_routine_task.dart';
import '../routine/routine_item_widget.dart';
import '../../../providers/mood_provider.dart';

class RoutinesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  'Back',
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
          child: Consumer<RoutineProvider>(
            builder: (context, provider, child) {
              var date = context.watch<MoodProvider>().date;
              var routineItems = provider.getRoutineForDate(date);
              return FutureBuilder(
                future: routineItems,
                builder: (context, routine) {
                  if (routine.data == null) {
                    return Container();
                  }
                  return ListView.builder(
                    itemCount: routine.data.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var item = routine.data[index];
                      return RoutineItemWidget(
                        date: date,
                        isChecked: item.isCompleted,
                        text: item.item,
                        key: UniqueKey(),
                        index: index,
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
        AddRoutineTask(),
      ],
    );
  }
}
