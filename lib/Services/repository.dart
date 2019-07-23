import 'package:attendance_manager/models/day_attendance.dart';

class Repository {
  static final Repository _singleton = new Repository._internal();

  factory Repository() {
    return _singleton;
  }

  Repository._internal();

  List<DayAttendance> attendances = [
    // DayAttendance(date: DateTime.now(), isPresent: true)
  ];

  void addAttendance(DayAttendance dayAttendance) {
    attendances.add(dayAttendance);
  }
}
