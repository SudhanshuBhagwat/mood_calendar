import 'package:flutter/material.dart';
import '../routine/routine_item_widget.dart';

class RoutinesWidget extends StatelessWidget {
  final items = [
    {'text': 'Hello World', 'isCompleted': true},
    {'text': 'A sample check item', 'isCompleted': true},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        var item = items[index];
        return RoutineItemWidget(
          isChecked: item['isCompleted'],
          text: item['text'],
          key: Key('$index'),
        );
      },
    );
  }
}
