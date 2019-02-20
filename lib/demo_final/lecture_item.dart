import 'package:flutter/material.dart';
import 'package:fontys_schedule/demo_final/info_section.dart';
import 'package:fontys_schedule/demo_final/types.dart';
import 'package:fontys_schedule/helper/lecture.dart';

class LectureItem extends StatefulWidget {

  final Lecture lecture;
  final AttendanceCallback callback;

  LectureItem({@required this.lecture, this.callback});

  @override
  State<StatefulWidget> createState() {
    return LectureItemState();
  }

}

class LectureItemState extends State<LectureItem> {

  bool isAttending = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildInfoSection(),
          Checkbox(
            value: isAttending,
            onChanged: (_) {
              bool newState = !isAttending;
              print("attendance changed");
              setState(() {
                isAttending = newState;

              });
              widget.callback(widget.lecture.id, newState);
            },
          ),
          Divider()
        ],
      ),
      margin: EdgeInsets.all(8.0),
    );
  }

  InfoSection _buildInfoSection() {
    return InfoSection(
        topText: "${widget.lecture.name}",
        bottomText: "${widget.lecture.lecturer}"
    );
  }

}