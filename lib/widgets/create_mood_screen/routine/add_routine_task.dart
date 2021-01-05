import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/routine_item.dart';
import '../../../providers/routine_provider.dart';

class AddRoutineTask extends StatefulWidget {
  @override
  _AddRoutineTaskState createState() => _AddRoutineTaskState();
}

class _AddRoutineTaskState extends State<AddRoutineTask>
    with SingleTickerProviderStateMixin {
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: 60.0,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[300],
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textEditingController,
              cursorHeight: 32.0,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          GestureDetector(
            onTap: () {
              if (_textEditingController.text != '') {
                RoutineItem routineItem = RoutineItem(
                  isCompleted: false,
                  item: _textEditingController.text,
                );
                context.read<RoutineProvider>().addRoutineItems(routineItem);
                _textEditingController.clear();
              }
            },
            child: Icon(
              Icons.add,
              size: 34.0,
            ),
          ),
        ],
      ),
    );
  }
}
