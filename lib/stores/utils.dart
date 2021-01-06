import 'package:jiffy/jiffy.dart';

String getDate(String dateTime) {
  List<String> date = dateTime.split('-');
  return Jiffy(
    DateTime(int.parse(date[0]), int.parse(date[1]), int.parse(date[2])),
  ).format('do MMMM y, EEEE');
}
