// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:my_app/models/schedule.dart';
import 'package:my_app/ui/inputschedule.dart';
import 'package:my_app/helpers/dbhelper.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  late List<Schedule>? scheduleList;

  @override
  Widget build(BuildContext context) {
    if (scheduleList == null) {
      scheduleList = <Schedule>[]; 
      updateListView(); 
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Schedule'),
      ),
      body: createListView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        tooltip: 'Input Schedule',
        onPressed: () async {
          var schedule = await navigateToEntryForm(context, null);
          if (schedule != null) addSchedule(schedule);
        },
      ),
    );
  }

  Future<Schedule> navigateToEntryForm(
      BuildContext context, Schedule? schedule) async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) {
      return InputSchedule(schedule!);
    }));
    return result;
  }

  Widget createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1!; 
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: const Icon(Icons.insert_chart),
            ),
            title: Text(scheduleList![index].name, style: textStyle), 
            subtitle: Text(scheduleList![index].keterangan), 
            trailing: GestureDetector(
              child: const Icon(Icons.delete),
              onTap: () {
                deleteSchedule(scheduleList![index]);
              },
            ),
            onTap: () async {
              var schedule = await navigateToEntryForm(
                  context, scheduleList![index]); 
              if (schedule != null) editSchedule(schedule);
            },
          ),
        );
      },
    );
  }

  void addSchedule(Schedule object) async {
    int result = await dbHelper.insert(object);
    if (result > 0) {
      updateListView();
    }
  }

  void editSchedule(Schedule object) async {
    int result = await dbHelper.update(object);
    if (result > 0) {
      updateListView();
    }
  }

  void deleteSchedule(Schedule object) async {
    int result = await dbHelper.delete(object.id);
    if (result > 0) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Schedule>> scheduleListFuture = dbHelper.getScheduleList();
      scheduleListFuture.then((scheduleList) {
        setState(() {
          this.scheduleList = scheduleList;
          this.count = scheduleList.length;
        });
      });
    });
  }
}
