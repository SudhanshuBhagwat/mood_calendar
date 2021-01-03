import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routine/routine_item_widget.dart';
import '../../../providers/mood_provider.dart';

class RoutinesWidget extends StatelessWidget {
  final items = [
    {'text': 'Hello World', 'isCompleted': false},
    {'text': 'A sample check item', 'isCompleted': true},
  ];

  Widget addItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[300],
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Icon(
        Icons.add,
        size: 34.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
              itemCount: 2,
              physics: BouncingScrollPhysics(),
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
          addItem(context),
        ],
      ),
    );
  }
}
