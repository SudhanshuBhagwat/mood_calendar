import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

import '../providers/mood_provider.dart';
import '../widgets/create_mood_screen/mood/create_mood_widget.dart';
import '../widgets/create_mood_screen/routine/routines_widget.dart';
import '../widgets/app_bar_container_widget.dart';
import '../widgets/create_mood_screen/mood/create_mood_app_bar_widget.dart';

class CreateMoodScreen extends StatelessWidget {
  final Animation<double> animation;
  final double _borderRadius = 30.0;
  final String date;

  CreateMoodScreen({this.animation, this.date});

  String getDate(String dateTime) {
    List<String> date = dateTime.split('-');
    return Jiffy(
      DateTime(int.parse(date[0]), int.parse(date[1]), int.parse(date[2])),
    ).format('do MMMM y, EEEE');
  }

  @override
  Widget build(BuildContext context) {
    print('Mood Widget Rerender');
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.red[400],
        resizeToAvoidBottomInset: false,
        appBar: AppBarContainer(
          child: CreateMoodAppBar(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
                top: 20.0,
                bottom: 30.0,
              ),
              child: AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0.1, 0),
                      end: Offset(0, 0),
                    ).animate(animation),
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
                child: Text(
                  '${getDate(date)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: AnimatedBuilder(
                animation: animation,
                builder: (context, _child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0, 1),
                      end: Offset(0, 0),
                    ).animate(animation),
                    child: _child,
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(_borderRadius),
                      topRight: Radius.circular(_borderRadius),
                    ),
                  ),
                  padding: const EdgeInsets.all(30.0),
                  child: Consumer<MoodProvider>(
                    builder: (context, provider, child) => SampleWidget(
                      index: provider.isEdit ? 1 : 0,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SampleWidget extends StatelessWidget {
  final int index;

  SampleWidget({this.index});

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: index,
      children: [
        CreateMood(),
        RoutinesWidget(),
      ],
    );
  }
}
