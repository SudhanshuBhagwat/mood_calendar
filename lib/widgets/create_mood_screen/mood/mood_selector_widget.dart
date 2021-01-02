import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/mood_provider.dart';
import '../../../stores/mood_colors.dart';

import 'mood_widget.dart';

class MoodSelector extends StatefulWidget {
  @override
  _MoodSelectorState createState() => _MoodSelectorState();
}

class _MoodSelectorState extends State<MoodSelector> {
  int _selectedIndex;

  @override
  void initState() {
    super.initState();
    String date = context.read<MoodProvider>().date;
    bool isPresent = context.read<MoodProvider>().isAlreadyPresent(date);
    MOOD mood = context.read<MoodProvider>().getMoodForDate(date);
    if (isPresent) {
      setState(() {
        _selectedIndex = mood.index;
      });
      context.read<MoodProvider>().moodEnum = _selectedIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MoodProvider>(context, listen: false);
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How was your mood today?',
            style: TextStyle(fontSize: 24.0),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            child: GridView.builder(
              padding: const EdgeInsets.all(0.0),
              itemCount: MOOD_COLORS.length - 1,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                MOOD mood = MOOD.values[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                    provider.moodEnum = index;
                  },
                  child: Mood(
                    color: MOOD_COLORS[mood],
                    mood: mood,
                    isSelected: index == _selectedIndex ? true : false,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
