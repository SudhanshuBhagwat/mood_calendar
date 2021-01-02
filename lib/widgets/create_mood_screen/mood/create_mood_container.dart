import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

import '../../../providers/mood_provider.dart';
import '../container_widget.dart';
import 'create_mood_widget.dart';

class CreateMoodContainer extends StatelessWidget {
  String getDate(String dateTime) {
    List<String> date = dateTime.split('-');
    return Jiffy(
      DateTime(int.parse(date[0]), int.parse(date[1]), int.parse(date[2])),
    ).format('do MMMM y, EEEE');
  }

  @override
  Widget build(BuildContext context) {
    final day = Provider.of<MoodProvider>(context).date;
    return ContainerWidget(
      child: CreateMood(),
      text: getDate(day),
    );
  }
}
