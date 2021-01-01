import 'package:hive/hive.dart';

part 'mood.g.dart';

@HiveType(typeId: 0)
class Mood {
  @HiveField(0)
  int mood;

  @HiveField(1)
  String title;

  Mood({this.mood, this.title});
}
