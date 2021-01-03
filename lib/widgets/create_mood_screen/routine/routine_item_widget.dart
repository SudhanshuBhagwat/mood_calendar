import 'package:flutter/material.dart';

class RoutineItemWidget extends StatelessWidget {
  final String text;
  final bool isChecked;
  final Key key;

  RoutineItemWidget({this.text, this.isChecked, this.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Dismissible(
        key: key,
        background: Container(
          decoration: BoxDecoration(
            color: Colors.red[400],
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[300],
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  value: isChecked,
                  onChanged: (value) {},
                ),
              ),
              SizedBox(
                width: 6.0,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 20.0,
                  decoration: isChecked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
