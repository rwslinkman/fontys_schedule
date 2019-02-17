import 'package:flutter/material.dart';
import 'package:fontys_schedule/demo_final/profile_page.dart';
import 'package:fontys_schedule/helper/datamodel.dart';
import 'package:fontys_schedule/helper/reader.dart';

class FontysSchedule extends StatefulWidget {

  DataModel data;

  @override
  State<StatefulWidget> createState() => new FontysScheduleState();
}

class FontysScheduleState extends State<FontysSchedule> {

  @override
  void initState() {
    super.initState();

    DataReader reader = new DataReader();
    reader.readData(context).then((model) {
      // Update the widget
      setState(() {
        widget.data = model;
        print(widget.data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fontys Lectures',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(title: 'Fontys Lecture Schedule'),
    );
  }

}