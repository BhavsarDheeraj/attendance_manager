import 'package:attendance_manager/models/day_attendance.dart';
import 'package:flutter/material.dart';

class AddAttendanceDialog extends StatefulWidget {
  final void Function(DayAttendance) onSaved;

  AddAttendanceDialog({@required this.onSaved});

  @override
  _AddAttendanceDialogState createState() => _AddAttendanceDialogState();
}

class _AddAttendanceDialogState extends State<AddAttendanceDialog> {
  bool _isPresent = true;
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text('Add Attendance'),
      ),
      content: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: <Widget>[
                  Text('Date: '),
                  FlatButton(
                    child: Text(
                      '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                    onPressed: _onDateButtonTapped,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: _isPresent,
                        onChanged: (value) {
                          if (value) {
                            _onCheckBoxValueChanged(value);
                          }
                        },
                      ),
                      Text('Present')
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: !_isPresent,
                        onChanged: (value) {
                          if (value) {
                            _onCheckBoxValueChanged(!value);
                          }
                        },
                      ),
                      Text('Absent')
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('SAVE'),
          onPressed: _saveButtonTapped,
        ),
      ],
    );
  }

  _saveButtonTapped() {
    widget.onSaved(
      DayAttendance(date: _selectedDate, isPresent: _isPresent),
    );
    Navigator.pop(context);
  }

  _onCheckBoxValueChanged(bool present) {
    setState(() {
      _isPresent = present;
    });
  }

  _onDateButtonTapped() async {
    DateTime pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now().subtract(Duration(days: 30)),
      initialDate: _selectedDate,
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
}
