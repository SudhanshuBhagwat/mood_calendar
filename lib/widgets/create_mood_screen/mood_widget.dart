import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../../stores/mood_colors.dart';

class Mood extends StatelessWidget {
  final MOOD mood;
  final Color color;
  final bool isSelected;

  Mood({this.mood, this.color, this.isSelected});

  @override
  Widget build(BuildContext context) {
    final _tileSize = (MediaQuery.of(context).size.width / 3) * 0.6;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: _tileSize,
              width: _tileSize,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: _tileSize * 0.6,
                    )
                  : Container(),
            ),
          ],
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          '${describeEnum(mood)}',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }
}
