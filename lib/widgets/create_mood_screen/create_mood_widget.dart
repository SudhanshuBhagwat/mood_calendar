import 'package:flutter/material.dart';
import 'package:mood_calendar/providers/mood_provider.dart';
import 'package:provider/provider.dart';
import '../../widgets/create_mood_screen/mood_selector_widget.dart';

class CreateMood extends StatefulWidget {
  @override
  _CreateMoodState createState() => _CreateMoodState();
}

class _CreateMoodState extends State<CreateMood> {
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    String date = context.read<MoodProvider>().date;
    bool isPresent = context.read<MoodProvider>().isAlreadyPresent(date);
    if (isPresent) {
      _textController.text = context.read<MoodProvider>().getMood(date).title;
      context.read<MoodProvider>().title = _textController.text;
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 30.0,
        right: 30.0,
        top: 30.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How was your day today?',
            style: TextStyle(fontSize: 24.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            controller: _textController,
            onChanged: (String text) {
              context.read<MoodProvider>().title = text;
            },
            maxLength: 120,
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 4,
            cursorHeight: 26.0,
            decoration: InputDecoration(
              counterStyle: TextStyle(fontSize: 16.0),
            ),
            style: TextStyle(
              fontSize: 20.0,
              letterSpacing: 1.0,
            ),
          ),
          MoodSelector(),
        ],
      ),
    );
  }
}
