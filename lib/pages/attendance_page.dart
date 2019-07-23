import 'package:attendance_manager/Services/repository.dart';
import 'package:flutter/material.dart';

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  Repository repo = Repository();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: repo.attendances.length,
        itemBuilder: (context, index) {
          var dayAttendance = repo.attendances[index];
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 1000,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Chip(
                          label: Text(
                            dayAttendance.isPresent ? 'PRESENT' : 'ABSENT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          padding: EdgeInsets.zero,
                          backgroundColor: dayAttendance.isPresent
                              ? Colors.green
                              : Colors.red,
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${dayAttendance.date.day}-${dayAttendance.date.month}-${dayAttendance.date.year}',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
