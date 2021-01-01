import 'package:flutter/material.dart';
import 'package:mood_calendar/providers/mood_provider.dart';
import 'package:provider/provider.dart';

class CreateMoodAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(left: 20.0, right: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              iconSize: 30.0,
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Container(),
            IconButton(
              iconSize: 30.0,
              icon: Icon(Icons.check),
              color: Colors.white,
              onPressed: () {
                context.read<MoodProvider>().saveMood();
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
