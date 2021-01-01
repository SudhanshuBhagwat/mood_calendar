import 'package:flutter/material.dart';
import '../widgets/home_screen/calendar_widget.dart';
import '../widgets/home_screen/app_bar_widget.dart';
import '../widgets/app_bar_container_widget.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarContainer(
        child: AppBarWidget(),
      ),
      body: SingleChildScrollView(child: CalendarWidget()),
    );
  }
}
