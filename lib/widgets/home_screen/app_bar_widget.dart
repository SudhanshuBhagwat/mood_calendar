import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
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
            // Text(
            //   'Calendar',
            //   style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            // ),
            //TODO Placeholder to put the Icon to the very right
            Container(),
            IconButton(
              iconSize: 34.0,
              icon: Icon(Icons.add),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
