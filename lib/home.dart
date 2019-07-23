import 'package:attendance_manager/Services/repository.dart';
import 'package:attendance_manager/pages/attendance_page.dart';
import 'package:attendance_manager/pages/home_page.dart';
import 'package:attendance_manager/widgets/add_attendace_dialog.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> _pages;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(),
      AttendancePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 8),
          child: _currentPage == 1
              ? Text('Attendance')
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'WELCOME BACK',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    Text('Dheeraj'),
                  ],
                ),
        ),
        centerTitle: false,
        actions: _currentPage == 1
            ? <Widget>[
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addAttendanceTapped,
                  tooltip: 'Add attendance',
                ),
              ]
            : null,
      ),
      body: _pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currentPage,
        onTap: _onPageSelected,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Attendance'),
          ),
        ],
      ),
    );
  }

  _onPageSelected(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  _addAttendanceTapped() {
    showDialog(
      context: context,
      builder: (context) => AddAttendanceDialog(
        onSaved: (attendance) {
          setState(() {
            Repository().addAttendance(attendance);
          });
        },
      ),
    );
  }
}
