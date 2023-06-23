import 'package:intl/intl.dart';
import '../models/task.dart';

int hexStringToHexInt(String hex) {
  hex = hex.replaceFirst('#', '');
  hex = hex.length == 6 ? 'ff$hex' : hex;
  int val = int.parse(hex, radix: 16);
  return val;
}

String formatDateTime(DateTime dateTime) {
  final russianMonths = [
    '',
    'января',
    'февраля',
    'марта',
    'апреля',
    'мая',
    'июня',
    'июля',
    'августа',
    'сентября',
    'октября',
    'ноября',
    'декабря'
  ];

  final day = dateTime.day.toString();
  final month = russianMonths[dateTime.month];
  final year = dateTime.year.toString();

  return '$day $month $year';
}

DateTime timeStampToDateTime(int timeStamp) {
  final DateTime dateTime =
      DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
  return dateTime;
}

int dateTimeToTimeStamp(DateTime dateTime) {
  final timeStamp = dateTime.millisecondsSinceEpoch;
  return timeStamp;
}

ImportanceType importanceFromString(String impStr) {
  if (impStr == 'basic') return ImportanceType.none;
  if (impStr == 'low') return ImportanceType.low;
  if (impStr == 'important') return ImportanceType.high;

  throw ArgumentError('Incorrect importance string: $impStr');
}

String importanceToString(ImportanceType imp) =>
    ['basic', 'low', 'important'][imp.index];
