import 'package:flutter/material.dart';

class AppBarContainer extends PreferredSize {
  final Widget child;
  final double height;
  final Color color;

  AppBarContainer({this.child, this.height = 90.0, this.color});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: color,
      child: child,
    );
  }
}
