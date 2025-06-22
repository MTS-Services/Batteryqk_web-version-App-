import 'package:flutter/material.dart';

final Map<String, int> weekDaysMap = {
  'Mon': DateTime.monday,
  'Tue': DateTime.tuesday,
  'Wed': DateTime.wednesday,
  'Thu': DateTime.thursday,
  'Fri': DateTime.friday,
  'Sat': DateTime.saturday,
  'Sun': DateTime.sunday,
};

List<int> parseAllowedWeekdays(String openingHours) {
  final rangePart = openingHours.split(':').first.trim();
  if (rangePart.contains('-')) {
    final parts = rangePart.split('-');
    final start = weekDaysMap[parts[0]];
    final end = weekDaysMap[parts[1]];
    if (start == null || end == null) return [];

    List<int> allowed = [];
    int current = start;
    while (true) {
      allowed.add(current);
      if (current == end) break;
      current = current % 7 + 1;
    }
    return allowed;
  } else {
    final single = weekDaysMap[rangePart];
    return single != null ? [single] : [];
  }
}

List<String> generateTimeSlots(String openingHours) {
  try {
    final timePart = openingHours.split(':').last.trim();
    final parts = timePart.split('-').map((s) => s.trim()).toList();
    if (parts.length != 2) return [];
    final start = parts[0];
    final end = parts[1];
    TimeOfDay startTime = parseTime(start);
    TimeOfDay endTime = parseTime(end);

    int hour = startTime.hour;
    int endHour = endTime.hour;
    if (end.contains('PM') && endHour < 12) endHour += 12;
    if (start.contains('PM') && hour < 12) hour += 12;

    List<String> slots = [];
    for (int h = hour; h <= endHour; h++) {
      slots.add(formatTimeLabel(h));
    }
    return slots;
  } catch (_) {
    return [];
  }
}

TimeOfDay parseTime(String s) {
  final match = RegExp(r'(\d{1,2})(?::(\d{2}))?\s*([AP]M)').firstMatch(s);
  if (match == null) return TimeOfDay(hour: 9, minute: 0);

  int hour = int.parse(match.group(1)!);
  int minute = match.group(2) != null ? int.parse(match.group(2)!) : 0;
  String ampm = match.group(3)!;

  if (ampm == "PM" && hour != 12) hour += 12;
  if (ampm == "AM" && hour == 12) hour = 0;

  return TimeOfDay(hour: hour, minute: minute);
}

String formatTimeLabel(int hour24) {
  int hour = hour24 % 12 == 0 ? 12 : hour24 % 12;
  String ampm = hour24 < 12 ? 'AM' : 'PM';
  return "$hour:00 $ampm";
}

DateTime findNextAllowedDate(List<int> allowedWeekdays, DateTime from) {
  for (int i = 0; i < 7; i++) {
    final date = from.add(Duration(days: i));
    if (allowedWeekdays.contains(date.weekday)) {
      return date;
    }
  }
  return from;
}
