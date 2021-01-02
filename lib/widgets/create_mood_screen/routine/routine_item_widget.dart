import 'package:flutter/material.dart';

class RoutineItemWidget extends StatelessWidget {
  final String text;
  final bool isChecked;
  final Key key;

  RoutineItemWidget({this.text, this.isChecked, this.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: key,
        child: Container(
          child: Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (value) {},
              ),
              Text(text)
            ],
          ),
        ));
  }
}
