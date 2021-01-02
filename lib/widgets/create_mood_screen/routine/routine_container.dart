import 'package:flutter/material.dart';
import 'package:mood_calendar/widgets/create_mood_screen/container_widget.dart';
import 'package:mood_calendar/widgets/create_mood_screen/routine/routines_widget.dart';

class RoutineContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      text: 'Create/Edit Routines',
      child: RoutinesWidget(),
    );
  }
}
