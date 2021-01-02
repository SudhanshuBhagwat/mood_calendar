import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routine/routine_item_widget.dart';
import '../../../providers/mood_provider.dart';

class RoutinesWidget extends StatelessWidget {
  final items = [
    {'text': 'Hello World', 'isCompleted': true},
    {'text': 'A sample check item', 'isCompleted': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Current Routines',
                style: TextStyle(fontSize: 24.0),
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
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                var item = items[index];
                return RoutineItemWidget(
                  isChecked: item['isCompleted'],
                  text: item['text'],
                  key: Key('$index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
