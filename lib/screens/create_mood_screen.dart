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

  CreateMoodScreen({this.animation});

  String getDate(String dateTime) {
    List<String> date = dateTime.split('-');
    return Jiffy(
      DateTime(int.parse(date[0]), int.parse(date[1]), int.parse(date[2])),
    ).format('do MMMM y, EEEE');
  }

  Widget getWidget(
    bool isEdit,
    String dateTime,
    Widget child,
    BuildContext context,
  ) {
    String text = isEdit ? 'Create/Edit Routines' : getDate(dateTime);
    return Container(
      child: Column(
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
                '$text',
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
              builder: (context, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0, 1),
                    end: Offset(0, 0),
                  ).animate(animation),
                  child: child,
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
                child: child,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MoodProvider>(context);
    bool isEdit = provider.isEdit;
    String date = provider.date;
    Widget widget = isEdit ? RoutinesWidget() : CreateMood();
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
        body: getWidget(isEdit, date, widget, context),
      ),
    );
  }
}
