import 'package:flutter/material.dart';
import 'package:mood_calendar/widgets/create_mood_screen/routine/routine_container.dart';
import 'package:provider/provider.dart';

import '../providers/mood_provider.dart';
import '../widgets/app_bar_container_widget.dart';
import '../widgets/create_mood_screen/mood/create_mood_app_bar_widget.dart';
import '../widgets/create_mood_screen/mood/create_mood_container.dart';

class CreateMoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isEdit = context.watch<MoodProvider>().isEdit;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.red[400],
        resizeToAvoidBottomInset: false,
        appBar: AppBarContainer(
          child: CreateMoodAppBar(),
        ),
        body: isEdit ? RoutineContainer() : CreateMoodContainer(),
      ),
    );
  }
}
