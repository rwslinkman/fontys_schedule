import 'package:flutter/material.dart';
import 'package:fontys_schedule/demo_final/profile_page.dart';

class FontysSchedule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fontys Lectures',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }

}