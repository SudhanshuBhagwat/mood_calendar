import 'package:flutter/material.dart';

enum MOOD { CHEERFUL, CALM, BORED, ANGRY, FEARFUL, SICK, NONE }

const MOOD_COLORS = {
  MOOD.CHEERFUL: Colors.amber,
  MOOD.ANGRY: Colors.red,
  MOOD.CALM: Colors.cyan,
  MOOD.BORED: Colors.grey,
  MOOD.FEARFUL: Colors.purple,
  MOOD.SICK: Colors.green,
  MOOD.NONE: Colors.transparent
};
