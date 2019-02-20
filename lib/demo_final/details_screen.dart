import 'package:flutter/material.dart';
import 'package:fontys_schedule/helper/lecture.dart';

class DetailsScreen extends StatelessWidget {

  final Lecture lecture;

  const DetailsScreen({Key key, this.lecture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Fontys Lecture Schedule'),
      ),
      body: Text("Hello world: ${lecture.name}"),
    );
  }

}