import 'package:flutter/material.dart';
import 'package:fontys_schedule/demo_final/info_section.dart';
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
      body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                _buildTitle(),
                Divider(
                    color: Colors.black
                ),
                _buildDataRow(Icons.star, this.lecture.lecturer, "Lecturer"),
                _buildDataRow(Icons.alarm, this.lecture.startsAt, "Starting time"),
                _buildDataRow(Icons.home, this.lecture.room, "Room")
              ],
            ),
          ),
          margin: EdgeInsets.only(top: 20.0)
      ),
    );
  }

  Widget _buildDataRow(IconData icon, String topData, String bottomData) {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(icon),
          ),
          InfoSection(
            topText: topData,
            bottomText: bottomData,
          )
        ],
      ),
      margin: EdgeInsets.only(bottom: 12.0)
    );
  }

  Widget _buildTitle() {
    return Container(
      child: Text("${lecture.name}",
        style: new TextStyle(
          color: Colors.black,
          fontSize: 24.0,
          fontWeight: FontWeight.bold
        ),
      ),
      margin: EdgeInsets.only(left: 8.0, right: 8.0),
    );
  }

}