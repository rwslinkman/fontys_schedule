import 'package:flutter/material.dart';
import 'package:fontys_schedule/demo_final/info_section.dart';
import 'package:fontys_schedule/helper/lecture.dart';

class LectureItem extends StatefulWidget {

  final Lecture lecture;
  final Function(String, bool) callback;
  final bool initialCheckState;

  LectureItem({@required this.lecture, this.initialCheckState, this.callback});

  @override
  State<StatefulWidget> createState() {
    return LectureItemState();
  }
}

class LectureItemState extends State<LectureItem> {

  bool isAttending;

  @override
  Widget build(BuildContext context) {
    isAttending = widget.initialCheckState;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InfoSection(
              topText: "${widget.lecture.name}",
              bottomText: "${widget.lecture.lecturer}"
          ),
          Checkbox(
            value: isAttending,
            onChanged: updateAttendance,
          ),
          Divider()
        ],
      ),
      margin: EdgeInsets.all(8.0),
    );
  }

  void updateAttendance(bool isChecked) {
    print("attendance changed");
    setState(() {
      isAttending = isChecked;
    });
    widget.callback(widget.lecture.id, isChecked);
  }
}