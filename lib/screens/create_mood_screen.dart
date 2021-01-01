import 'package:flutter/material.dart';
import '../widgets/create_mood_screen/create_mood_app_bar_widget.dart';
import '../widgets/create_mood_screen/create_mood_widget.dart';
import '../widgets/app_bar_container_widget.dart';
import 'package:jiffy/jiffy.dart';

class CreateMoodScreen extends StatelessWidget {
  static const routeName = '/create-mood';
  final double _borderRadius = 30.0;
  final DateTime day;

  CreateMoodScreen({this.day});

  String getDate(DateTime dateTime) {
    return Jiffy(dateTime).format('do MMMM y, EEEE');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[400],
      resizeToAvoidBottomInset: false,
      appBar: AppBarContainer(
        child: CreateMoodAppBar(),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                child: Text(
                  '${getDate(day)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(_borderRadius),
                      topRight: Radius.circular(_borderRadius),
                    ),
                  ),
                  child: CreateMood(),
                ),
              ),
            ],
          )),
    );
  }
}
