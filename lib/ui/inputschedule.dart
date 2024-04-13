import 'package:flutter/material.dart';
import 'package:my_app/models/schedule.dart';

class InputSchedule extends StatefulWidget {
  final Schedule schedule;
  InputSchedule(this.schedule);
  @override
  _InputScheduleState createState() => _InputScheduleState(schedule);
}

class _InputScheduleState extends State<InputSchedule> {
  Schedule schedule;
  TextEditingController nameController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();

  _InputScheduleState(this.schedule) {
    if (schedule != null) {
      nameController.text = schedule.name;
      keteranganController.text = schedule.keterangan;
      tanggalController.text = schedule.tanggal;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: schedule == null ? Text('New Schedule') : Text("Update Schedule"),
        leading: Icon(Icons.keyboard_arrow_left),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: tanggalController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Tanggal",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: keteranganController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Keterangan",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (schedule == null) {
                          schedule = Schedule(
                            nameController.text,
                            tanggalController.text,
                            keteranganController.text,
                          );
                        } else {
                          schedule.name = nameController.text;
                          schedule.tanggal = tanggalController.text;
                          schedule.keterangan = keteranganController.text;
                        }
                        Navigator.pop(context, schedule);
                      },
                      child: Text("Simpan", textScaleFactor: 1.5),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColorDark),
                        foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColorLight),
                      ),
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Batal", textScaleFactor: 1.5),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColorDark),
                        foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColorLight),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
