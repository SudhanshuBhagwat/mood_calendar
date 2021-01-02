import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final double _borderRadius = 30.0;
  final Widget child;
  final String text;

  ContainerWidget({this.child, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              '$text',
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
              padding: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
                top: 30.0,
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
